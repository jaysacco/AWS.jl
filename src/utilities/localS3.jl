module localS3

using AWS, HTTP, Dates

Base.@kwdef mutable struct LocalS3Request
    method::String = ""
    target::String = ""
end

Base.@kwdef mutable struct LocalS3Response
    request::LocalS3Request = LocalS3Request()
    body::String = ""
end


version = v"1.1.0"
status = 200

default_headers = Pair[
    "x-amz-id-2" => "x-amz-id-2",
    "x-amz-request-id" => "x-amz-request-id",
    "x-amz-bucket-region" => "us-east-1",
    "Content-Type" => "application/xml",
    "Transfer-Encoding" => "chunked",
    "Server" => "AmazonS3",
]

body = """
    <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n
    <ListBucketResult xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">
        <Name>sample-bucket</Name>
        <Prefix></Prefix>
        <Marker></Marker>
        <MaxKeys>1000</MaxKeys>
        <IsTruncated>false</IsTruncated>
        <Contents>
            <Key>test.txt</Key>
            <LastModified>2020-06-16T21:37:34.000Z</LastModified>
            <ETag>&quot;d41d8cd98f00b204e9800998ecf8427e&quot;</ETag>
            <Size>0</Size>
            <Owner>
                <ID>id</ID>
                <DisplayName>matt.brzezinski</DisplayName>
            </Owner>
            <StorageClass>STANDARD</StorageClass>
        </Contents>
    </ListBucketResult>
    """

function create_error_xml(error_code::String, error_msg::String, resource)
    body = """
    <?xml version="1.0" encoding="UTF-8"?>
    <Error>
    <Code>$(error_code)</Code>
    <Message>$(error_msg)</Message>
    <Resource>/$(resource)</Resource> 
    <RequestId>4442587FB7D0A2F9</RequestId>
    </Error>
    """
    return(body)
end

# Override AWS S3 requests to use the local file system instead of S3
function request(creds::AWS.AWSCredentials, request::AWS.Request)
	# NOTE: we could use the URIs.jl package to parse but that seems overweight for what we need to do here
    # request.resource e.g. /my.bucket?CreateBucketConfiguration=%3CCreateBucketConfiguration%20xmlns%3D%22http%3A%2F%2Fs3.amazonaws.com%2Fdoc%2F2006-03-01%2F%22%3E%0A%20%20%20%20%3CLocationConstraint%3Eus-east-2%3C%2FLocationConstraint%3E%0A%3C%2FCreateBucketConfiguration%3E%0A"
    # Convert encoded characters in the URL with the actual character
    resource = replace(request.resource, "%3A" => ":")
    resource = replace(resource, "%5C" => "/")
    resource = lstrip(resource, ['/']) # Remove leading forward slash
    if occursin("?", resource)
        resource = split(resource,"?") # Separate any query parameters from the requested resource
        query_parms = resource[2] # e.g. "CreateBucketConfiguration=%3CCreateBucketConfiguration%20xmlns%3D%22http%3A%2F%2Fs3.amazonaws.com%2Fdoc%2F2006-03-01%2F%22%3E%0A%20%20%20%20%3CLocationConstraint%3Eus-east-2%3C%2FLocationConstraint%3E%0A%3C%2FCreateBucketConfiguration%3E%0A"
        resource = resource[1]
    else
        query_parms = ""
    end

    method = request.request_method # PUT, GET etc.
    user = creds.user_arn
    status = 200
    error_code = ""
    error_msg = ""
    headers = default_headers

    if method == "PUT" && startswith(query_parms, "CreateBucketConfiguration")
        # Create bucket https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html
        # resource is the name of the directory to create, assume it starts with a / character
        # Make sure the bucket doesn't already exist, bucket names must be globally unique even between user accounts
        if ispath(resource)
            # Bucket already exists
            # If user owns the bucket
            if occursin(user, resource)
                error_code = "BucketAlreadyOwnedByYou"
                error_msg = "The bucket that you tried to create already exists, and you own it."
                status = 400
            else
                error_code = "BucketAlreadyExists"
                error_msg = "The requested bucket name is not available. The bucket namespace is shared by all users of the system. Specify a different name and try again."
                status = 409
            end
            # Return error
            body = Vector{UInt8}(create_error_xml(error_code, error_msg, resource))
            rqst = HTTP.Request(method, resource, headers, body)
            resp =  HTTP.Messages.Response(status, headers, body, request = rqst)
            #e = HTTP.StatusError(status, method, resource, resp)
            throw(resp)
        else
            try
                mkpath(resource)
                push!(headers, "Location" => "/" * resource)
            catch err
                # If not successful
                error_code = "InvalidBucketName"
                error_msg = "The specified bucket is not valid."
                status = 409
                body = create_error_xml(error_code, error_msg, resource)
                throw(body)
            end
        end
    end
    _response(status = status, headers = headers, body = body)
end

function _response(;
    version::VersionNumber=version,
    status::Int64=status,
    headers::Array=default_headers,
    body::String=body,
)
    # Add the current date in GMT to the headers
    push!(headers, "Dates" => Dates.format(Dates.now(UTC), RFC1123Format) * " GMT" )
    response = HTTP.Messages.Response()
    response.version = version
    response.status = status
    response.headers = headers
    response.body = b"[Message Body was streamed]"

    b = IOBuffer(body)

    return AWS.Response(response, b)
end


end # module localS3
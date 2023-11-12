module localS3

using AWS, HTTP, Dates


function create_error_xml(error_code::String, error_msg::String, resource)
    body = """
    <?xml version="1.0" encoding="UTF-8"?>
    <Error xmlns=\"http://s3.amazonaws.com/doc/2006-03-01/\">
    <Code>$(error_code)</Code>
    <Message>$(error_msg)</Message>
    <Resource>/$(resource)</Resource> 
    <RequestId>No ID For local S3</RequestId>
    </Error>
    """
    return(body)
end

function create_list_bucket_result(bucket_name, keylist)
    numkeys = length(keylist)
    result_prefix = """
    <ListBucketResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
        <Name>$(bucket_name)</Name>
        <Prefix/>
        <KeyCount>$(numkeys)</KeyCount>
        <MaxKeys>1000</MaxKeys>
        <IsTruncated>$(numkeys > 1000)</IsTruncated>
        """
    result_contents = ""
    for k in keylist
        result_contents *= """
        <Contents>
            <Key>$(k["Key"])</Key>
            <LastModified>TBD</LastModified>
            <ETag>TBD</ETag>
            <Size>TBD</Size>
            <StorageClass>STANDARD</StorageClass>
        </Contents>
        """
    end
    result_end = """
        </ListBucketResult>
        """
    return(result_prefix * result_contents * result_end)
end

"""
    submit_request(aws::AbstractAWSConfig, request::Request; return_headers::Bool=false)

Submit the request to AWS.

# Arguments
- `status`: The http status code e.g. 200, 400 etc.
- `error_code`: AWS error code e.g. "BucketAlreadyOwnedByYou"
- `error_msg`: AWS error message e.g. "The bucket that you tried to create already exists, and you own it."
- `headers`: http headers e.g. Pair["x-amz-id-2" => "x-amz-id-2", "x-amz-request-id" => "x-amz-request-id"]
- `method`: The http request method e.g. "PUT"
- `resource`: The resource requesteg e.g. ""/CFI_Storage/users/jaysacco/newBucket"

# Returns
- `AWS.statuserror`
"""
#function create_AWSException(status::Integer, error_code::String, error_msg::String, headers, method::String, resource::String)
function create_AWSException(status , error_code, error_msg, headers, method, resource)
    push!(headers, "Date" => Dates.format(Dates.now(UTC), RFC1123Format) * " GMT" )
    body = create_error_xml(error_code, error_msg, resource)
    rqst = HTTP.Request(method, resource, headers, body)
    resp =  HTTP.Response(status, headers, body, request = rqst)
    return AWS.statuserror(status, resp)
end

# Override AWS S3 requests to use the local file system instead of S3
function request(creds::AWS.AWSCredentials, request::AWS.Request)

    # Set default values
    version = v"1.1.0"
    status = 200
    
    """
    Must be added during request processing in this module
    "Date" => "TBD",
    "Content-Length" => "0",
    "Content-Type" =? TBD,
    """
    response_headers = Pair[
        "x-amz-id-2" => "x-amz-id-2",
        "x-amz-request-id" => "No ID For local S3",
        "Server" => "AmazonS3",
    ]
    
    # request.resource e.g. /my.bucket?CreateBucketConfiguration=%3CCreateBucketConfiguration%20xmlns%3D%22http%3A%2F%2Fs3.amazonaws.com%2Fdoc%2F2006-03-01%2F%22%3E%0A%20%20%20%20%3CLocationConstraint%3Eus-east-2%3C%2FLocationConstraint%3E%0A%3C%2FCreateBucketConfiguration%3E%0A"
    resource_url = HTTP.URIs.URI(request.url)
    resource_path = resource_url.path
    # Convert encoded characters in the URL with the actual character
    resource = HTTP.URIs.unescapeuri(resource_path)
    resource = lstrip(resource, ['/']) # Remove leading forward slash
    query_parms = HTTP.URIs.queryparams(resource_url)
    method = request.request_method # PUT, GET etc.
    user = creds.user_arn
    status = 200
    error_code = ""
    error_msg = ""
    body = ""
    content_type = "text/html" # If non specified, treat as text
    # S3 resources come in the form of <bucket>/s3://<fully qualified path to data key> e.g. 
    # "TestBucket/s3://C:/Users/jaysa/Documents/git/cfi/CFI_Storage/jaysacco/TestBucket/datakey1"
    s3_resource = split(resource, "s3://")
    @show(request)
    @show(method)
    @show(s3_resource)
    @show(query_parms)
    if method == "PUT"
        #
        # Create Bucket
        #
        if haskey(query_parms, "CreateBucketConfiguration")
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
                ex = create_AWSException(status, error_code, error_msg, response_headers, method, resource)
                throw(ex)
            else
                try
                    mkpath(resource)
                    push!(response_headers, "Location" => "/" * resource)
                catch err
                    # If the file system couldn't create the directory, assume it's a problem with the bucket's path/name (e.g. not lack of disk space)
                    error_code = "InvalidBucketName"
                    error_msg = "The specified bucket is not valid."
                    status = 409
                    ex = create_AWSException(status, error_code, error_msg, response_headers, method, resource)
                    throw(ex)
                end
            end
        # End create bucket
        #
        # put object
        #
        elseif length(s3_resource) > 1
            fq_data_key = last(s3_resource)
            bucket_name = first(s3_resource)
            # Fully qualify the bucket name
            fq_bucket_name = first(fq_data_key, findfirst(bucket_name, fq_data_key)[end])
            # If the bucket doesn't exist
            if !isdir(fq_bucket_name)
                error_code = "NoSuchBucket"
                error_msg = "The specified bucket does not exist."
                status = 404
                ex = create_AWSException(status, error_code, error_msg, response_headers, method, resource)
                throw(ex)
            end
            # Override default content type established above if specified in request headers
            if haskey(request.headers,"Content-Type")
                content_type = request.headers["Content-Type"]
            end
            # Put content type in the metadata and add any other metadata from the request headers
            metadata = ["content-type" => content_type]
            for md in request.headers
                split_md = split(md[1], "x-amz-meta-")
                if length(split_md) > 1
                    append!(metadata, [split_md[2] => md[2]])
                end
            end
            # Make sure all intermediate folders specified by the object key exist
            mkpath(dirname(fq_data_key))
            open(fq_data_key, "w") do file
                write(file, request.content)
            end
            open(fq_data_key * ".metadata", "w") do file
                write(file, string(metadata))
            end
        end  # Put object

    elseif method == "GET"
        #
        # get object
        #
        if length(s3_resource) > 1
            fq_data_key = last(s3_resource)
            # Read metadata first to get the content-type of the object
            io = open(fq_data_key * ".metadata", "r")
            meta_data = read(io, String)
            close(io)
            # Convert meta_data to array of pairs and get content_type
            metadata = eval(Meta.parse(meta_data))
            for p in metadata
                if p[1] == "Content-Type"
                    content_type = p[2]
                    break
                end
            end  
            io_type = String # Default IO type
            if startswith(content_type, "text")
                io_type = String
            end
            io = open(fq_data_key, "r")
            object_data = read(io, io_type)
            close(io)
            # Add metadata to response headers
            append!(response_headers, metadata)
            body = object_data
        # end get object
        #
        # List objects. Returns a list of keys (up to 1000) of the objects in the specified bucket
        #
        elseif haskey(query_parms, "list-type")
            # The fully qualified path to the bucket is the first item in the s3 resource array
            fq_bucket = s3_resource[1]
            # Get the fully qualified path up to the bucket i.e. the path prefix to the bucket. This is
            # the path up to and including the user name, which is the last element before the bucket name starts.
            # Note that the bucket name could be a path to a subdirectory so we can't just remove the last element of the path
            path_prefix = splitpath(fq_bucket)
            # Remove the last path elements up to and including the user name
            while pop!(path_prefix ) != user end
            # Add the user name back in with trailing slash to complete the prefix. Use normpath
            # to make sure the trailing slash is converted to the local OS path separator
            # This will make the returned list of object keys start with the bucket name, not a path separator
            path_prefix = normpath(joinpath(push!(path_prefix, user * "/")))
            bucket_name = replace(fq_bucket, path_prefix => "")
            object_list = []
            for k in walkdir(fq_bucket)
                # If there are files in this iteration
                for f in k[3]
                    # Don't include metadata in the key list
                    if !endswith(f, ".metadata")
                        # Form the key to the file by joining the fully qualified directory path to the file name
                        fkey = replace(joinpath(k[1], f), path_prefix => "")
                        push!(object_list, Dict("Key" => fkey))
                    end
                end
            end
            push!(response_headers, "Content-Type" => "application/xml")
            body = replace(create_list_bucket_result(bucket_name, object_list), "\n" =>"")
        end # list objects
    elseif method == "HEAD"
        #
        # get_meta data
        #
        if length(s3_resource) > 1
            fq_data_key = last(s3_resource)
            io = open(fq_data_key * ".metadata", "r")
            meta_data = read(io, String)
            close(io)
            # Convert meta_data to array of pairs
            metadata = eval(Meta.parse(meta_data))
            # Add metadata to response headers
            append!(response_headers, metadata)
        end # get_meta data
    elseif method == "DELETE"
        #
        # delete object.  If the object is a multidirectory key, each directory in the key will
        # be deleted if it contains no files after the key is deleted.
        # if the object doesn't exist, doesn't return error
        #
        if length(s3_resource) > 1
            bucket_name = chop(s3_resource[1])
            fq_data_key = last(s3_resource)
            fq_metadata_key = fq_data_key * ".metadata"
            rm(fq_data_key, force=true, recursive=true)
            rm(fq_metadata_key, force=true, recursive=true)
            # Process multidirectory key
            fq_data_key = splitdir(fq_data_key)[1] # Remove the last element of the key path
            # While we haven't gotten back to the bucket the key resides in
            while(!endswith(fq_data_key, bucket_name))
                # if the last directory in the updated key path is empty, remove it
                if length(readdir(fq_data_key)) == 0
                    rm(fq_data_key)
                end
                fq_data_key = splitdir(fq_data_key)[1] # Remove the last element of the key path
            end
            status = 204
            # End delete object
        #
        # delete bucket.  The bucket must be a directory and must be empty to be deleted.
        #
        elseif length(s3_resource) == 1
            s3_resource = s3_resource[1]
            # Extract the fully qualified path to bucket
            last_colon_i = findlast(":", s3_resource)[1]
            fq_bucket = chop(s3_resource, head = last_colon_i - 2, tail = 0)
            # If bucket is not a directory
            if !isdir(fq_bucket)
                error_code = "NoSuchBucket"
                error_msg = "The specified bucket does not exist."
                status = 404
                ex = create_AWSException(status, error_code, error_msg, response_headers, method, resource)
                throw(ex)
            # If bucket isn't empty
            elseif length(readdir(fq_bucket)) != 0
                error_code = "BucketNotEmpty"
                error_msg = "The bucket that you tried to delete is not empty."
                status = 409
                ex = create_AWSException(status, error_code, error_msg, response_headers, method, resource)
                throw(ex)
            else
                # Delete bucket
                rm(fq_bucket)
                status = 204
            end
        end # delete object
    end # method == xx
    println("Sending $status response")
    return _response(version = version, status = status, headers = response_headers, body = body)
end

"""
    _response(;
    version::VersionNumber=version,
    status::Int64=status,
    headers::Array=default_headers, Must not include Date or Content_Length
    body::String=body,
)

Creates an HTTP.Messages.Response based on the input parameters and addes the header Date and Content_Length values
Returns an HTTP.Messages.Response
"""
function _response(;
    version::VersionNumber=version,
    status::Int64=status,
    headers::Array,
    body::String=body,
)
    response = HTTP.Messages.Response()
    response.version = version
    response.status = status
    content_length = 0
    if !isempty(body)
        content_length = length(body)
        response.body = IOBuffer(body)
    end
    push!(headers, "Content_Length" => string(content_length))
    push!(headers, "Date" => Dates.format(Dates.now(UTC), RFC1123Format) * " GMT" )
    response.headers = headers
    return(response)
end

end # module localS3
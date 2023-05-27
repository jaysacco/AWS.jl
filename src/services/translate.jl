# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: translate
using AWS.Compat
using AWS.UUIDs

"""
    create_parallel_data(client_token, name, parallel_data_config)
    create_parallel_data(client_token, name, parallel_data_config, params::Dict{String,<:Any})

Creates a parallel data resource in Amazon Translate by importing an input file from Amazon
S3. Parallel data files contain examples that show how you want segments of text to be
translated. By adding parallel data, you can influence the style, tone, and word choice in
your translation output.

# Arguments
- `client_token`: A unique identifier for the request. This token is automatically
  generated when you use Amazon Translate through an AWS SDK.
- `name`: A custom name for the parallel data resource in Amazon Translate. You must assign
  a name that is unique in the account and region.
- `parallel_data_config`: Specifies the format and S3 location of the parallel data input
  file.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Description"`: A custom description for the parallel data resource in Amazon Translate.
- `"EncryptionKey"`:
- `"Tags"`: Tags to be associated with this resource. A tag is a key-value pair that adds
  metadata to a resource. Each tag key for the resource must be unique. For more information,
  see  Tagging your resources.
"""
function create_parallel_data(
    ClientToken, Name, ParallelDataConfig; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "CreateParallelData",
        Dict{String,Any}(
            "ClientToken" => ClientToken,
            "Name" => Name,
            "ParallelDataConfig" => ParallelDataConfig,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_parallel_data(
    ClientToken,
    Name,
    ParallelDataConfig,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "CreateParallelData",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ClientToken" => ClientToken,
                    "Name" => Name,
                    "ParallelDataConfig" => ParallelDataConfig,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_parallel_data(name)
    delete_parallel_data(name, params::Dict{String,<:Any})

Deletes a parallel data resource in Amazon Translate.

# Arguments
- `name`: The name of the parallel data resource that is being deleted.

"""
function delete_parallel_data(Name; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "DeleteParallelData",
        Dict{String,Any}("Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_parallel_data(
    Name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "DeleteParallelData",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Name" => Name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_terminology(name)
    delete_terminology(name, params::Dict{String,<:Any})

A synchronous action that deletes a custom terminology.

# Arguments
- `name`: The name of the custom terminology being deleted.

"""
function delete_terminology(Name; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "DeleteTerminology",
        Dict{String,Any}("Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_terminology(
    Name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "DeleteTerminology",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Name" => Name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_text_translation_job(job_id)
    describe_text_translation_job(job_id, params::Dict{String,<:Any})

Gets the properties associated with an asynchronous batch translation job including name,
ID, status, source and target languages, input/output S3 buckets, and so on.

# Arguments
- `job_id`: The identifier that Amazon Translate generated for the job. The
  StartTextTranslationJob operation returns this identifier in its response.

"""
function describe_text_translation_job(
    JobId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "DescribeTextTranslationJob",
        Dict{String,Any}("JobId" => JobId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_text_translation_job(
    JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "DescribeTextTranslationJob",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_parallel_data(name)
    get_parallel_data(name, params::Dict{String,<:Any})

Provides information about a parallel data resource.

# Arguments
- `name`: The name of the parallel data resource that is being retrieved.

"""
function get_parallel_data(Name; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "GetParallelData",
        Dict{String,Any}("Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_parallel_data(
    Name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "GetParallelData",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Name" => Name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_terminology(name)
    get_terminology(name, params::Dict{String,<:Any})

Retrieves a custom terminology.

# Arguments
- `name`: The name of the custom terminology being retrieved.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"TerminologyDataFormat"`: The data format of the custom terminology being retrieved. If
  you don't specify this parameter, Amazon Translate returns a file with the same format as
  the file that was imported to create the terminology.  If you specify this parameter when
  you retrieve a multi-directional terminology resource, you must specify the same format as
  the input file that was imported to create it. Otherwise, Amazon Translate throws an error.
"""
function get_terminology(Name; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "GetTerminology",
        Dict{String,Any}("Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_terminology(
    Name, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "GetTerminology",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("Name" => Name), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    import_terminology(merge_strategy, name, terminology_data)
    import_terminology(merge_strategy, name, terminology_data, params::Dict{String,<:Any})

Creates or updates a custom terminology, depending on whether one already exists for the
given terminology name. Importing a terminology with the same name as an existing one will
merge the terminologies based on the chosen merge strategy. The only supported merge
strategy is OVERWRITE, where the imported terminology overwrites the existing terminology
of the same name. If you import a terminology that overwrites an existing one, the new
terminology takes up to 10 minutes to fully propagate. After that, translations have access
to the new terminology.

# Arguments
- `merge_strategy`: The merge strategy of the custom terminology being imported. Currently,
  only the OVERWRITE merge strategy is supported. In this case, the imported terminology will
  overwrite an existing terminology of the same name.
- `name`: The name of the custom terminology being imported.
- `terminology_data`: The terminology data for the custom terminology being imported.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Description"`: The description of the custom terminology being imported.
- `"EncryptionKey"`: The encryption key for the custom terminology being imported.
- `"Tags"`: Tags to be associated with this resource. A tag is a key-value pair that adds
  metadata to a resource. Each tag key for the resource must be unique. For more information,
  see  Tagging your resources.
"""
function import_terminology(
    MergeStrategy, Name, TerminologyData; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "ImportTerminology",
        Dict{String,Any}(
            "MergeStrategy" => MergeStrategy,
            "Name" => Name,
            "TerminologyData" => TerminologyData,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function import_terminology(
    MergeStrategy,
    Name,
    TerminologyData,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "ImportTerminology",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "MergeStrategy" => MergeStrategy,
                    "Name" => Name,
                    "TerminologyData" => TerminologyData,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_languages()
    list_languages(params::Dict{String,<:Any})

Provides a list of languages (RFC-5646 codes and names) that Amazon Translate supports.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"DisplayLanguageCode"`: The language code for the language to use to display the
  language names in the response. The language code is en by default.
- `"MaxResults"`: The maximum number of results to return in each response.
- `"NextToken"`: Include the NextToken value to fetch the next group of supported
  languages.
"""
function list_languages(; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "ListLanguages"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_languages(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "ListLanguages", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_parallel_data()
    list_parallel_data(params::Dict{String,<:Any})

Provides a list of your parallel data resources in Amazon Translate.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of parallel data resources returned for each request.
- `"NextToken"`: A string that specifies the next page of results to return in a paginated
  response.
"""
function list_parallel_data(; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "ListParallelData"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_parallel_data(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "ListParallelData", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_tags_for_resource(resource_arn)
    list_tags_for_resource(resource_arn, params::Dict{String,<:Any})

Lists all tags associated with a given Amazon Translate resource. For more information, see
 Tagging your resources.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the given Amazon Translate resource you
  are querying.

"""
function list_tags_for_resource(
    ResourceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "ListTagsForResource",
        Dict{String,Any}("ResourceArn" => ResourceArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    ResourceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "ListTagsForResource",
        Dict{String,Any}(
            mergewith(_merge, Dict{String,Any}("ResourceArn" => ResourceArn), params)
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_terminologies()
    list_terminologies(params::Dict{String,<:Any})

Provides a list of custom terminologies associated with your account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"MaxResults"`: The maximum number of custom terminologies returned per list request.
- `"NextToken"`: If the result of the request to ListTerminologies was truncated, include
  the NextToken to fetch the next group of custom terminologies.
"""
function list_terminologies(; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "ListTerminologies"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_terminologies(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "ListTerminologies", params; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end

"""
    list_text_translation_jobs()
    list_text_translation_jobs(params::Dict{String,<:Any})

Gets a list of the batch translation jobs that you have submitted.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Filter"`: The parameters that specify which batch translation jobs to retrieve. Filters
  include job name, job status, and submission time. You can only set one filter at a time.
- `"MaxResults"`: The maximum number of results to return in each page. The default value
  is 100.
- `"NextToken"`: The token to request the next page of results.
"""
function list_text_translation_jobs(; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "ListTextTranslationJobs"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_text_translation_jobs(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "ListTextTranslationJobs",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    start_text_translation_job(client_token, data_access_role_arn, input_data_config, output_data_config, source_language_code, target_language_codes)
    start_text_translation_job(client_token, data_access_role_arn, input_data_config, output_data_config, source_language_code, target_language_codes, params::Dict{String,<:Any})

Starts an asynchronous batch translation job. Use batch translation jobs to translate large
volumes of text across multiple documents at once. For batch translation, you can input
documents with different source languages (specify auto as the source language). You can
specify one or more target languages. Batch translation translates each input document into
each of the target languages. For more information, see Asynchronous batch processing.
Batch translation jobs can be described with the DescribeTextTranslationJob operation,
listed with the ListTextTranslationJobs operation, and stopped with the
StopTextTranslationJob operation.

# Arguments
- `client_token`: A unique identifier for the request. This token is generated for you when
  using the Amazon Translate SDK.
- `data_access_role_arn`: The Amazon Resource Name (ARN) of an AWS Identity Access and
  Management (IAM) role that grants Amazon Translate read access to your input data. For more
  information, see Identity and access management .
- `input_data_config`: Specifies the format and location of the input documents for the
  translation job.
- `output_data_config`: Specifies the S3 folder to which your job output will be saved.
- `source_language_code`: The language code of the input language. Specify the language if
  all input documents share the same language. If you don't know the language of the source
  files, or your input documents contains different source languages, select auto. Amazon
  Translate auto detects the source language for each input document. For a list of supported
  language codes, see Supported languages.
- `target_language_codes`: The target languages of the translation job. Enter up to 10
  language codes. Each input file is translated into each target language. Each language code
  is 2 or 5 characters long. For a list of language codes, see Supported languages.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"JobName"`: The name of the batch translation job to be performed.
- `"ParallelDataNames"`: The name of a parallel data resource to add to the translation
  job. This resource consists of examples that show how you want segments of text to be
  translated. If you specify multiple target languages for the job, the parallel data file
  must include translations for all the target languages. When you add parallel data to a
  translation job, you create an Active Custom Translation job.  This parameter accepts only
  one parallel data resource.  Active Custom Translation jobs are priced at a higher rate
  than other jobs that don't use parallel data. For more information, see Amazon Translate
  pricing.  For a list of available parallel data resources, use the ListParallelData
  operation. For more information, see  Customizing your translations with parallel data.
- `"Settings"`: Settings to configure your translation output, including the option to set
  the formality level of the output text and the option to mask profane words and phrases.
- `"TerminologyNames"`: The name of a custom terminology resource to add to the translation
  job. This resource lists examples source terms and the desired translation for each term.
  This parameter accepts only one custom terminology resource. If you specify multiple target
  languages for the job, translate uses the designated terminology for each requested target
  language that has an entry for the source term in the terminology file. For a list of
  available custom terminology resources, use the ListTerminologies operation. For more
  information, see Custom terminology.
"""
function start_text_translation_job(
    ClientToken,
    DataAccessRoleArn,
    InputDataConfig,
    OutputDataConfig,
    SourceLanguageCode,
    TargetLanguageCodes;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "StartTextTranslationJob",
        Dict{String,Any}(
            "ClientToken" => ClientToken,
            "DataAccessRoleArn" => DataAccessRoleArn,
            "InputDataConfig" => InputDataConfig,
            "OutputDataConfig" => OutputDataConfig,
            "SourceLanguageCode" => SourceLanguageCode,
            "TargetLanguageCodes" => TargetLanguageCodes,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function start_text_translation_job(
    ClientToken,
    DataAccessRoleArn,
    InputDataConfig,
    OutputDataConfig,
    SourceLanguageCode,
    TargetLanguageCodes,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "StartTextTranslationJob",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ClientToken" => ClientToken,
                    "DataAccessRoleArn" => DataAccessRoleArn,
                    "InputDataConfig" => InputDataConfig,
                    "OutputDataConfig" => OutputDataConfig,
                    "SourceLanguageCode" => SourceLanguageCode,
                    "TargetLanguageCodes" => TargetLanguageCodes,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    stop_text_translation_job(job_id)
    stop_text_translation_job(job_id, params::Dict{String,<:Any})

Stops an asynchronous batch translation job that is in progress. If the job's state is
IN_PROGRESS, the job will be marked for termination and put into the STOP_REQUESTED state.
If the job completes before it can be stopped, it is put into the COMPLETED state.
Otherwise, the job is put into the STOPPED state. Asynchronous batch translation jobs are
started with the StartTextTranslationJob operation. You can use the
DescribeTextTranslationJob or ListTextTranslationJobs operations to get a batch translation
job's JobId.

# Arguments
- `job_id`: The job ID of the job to be stopped.

"""
function stop_text_translation_job(JobId; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "StopTextTranslationJob",
        Dict{String,Any}("JobId" => JobId);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function stop_text_translation_job(
    JobId, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "StopTextTranslationJob",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("JobId" => JobId), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Associates a specific tag with a resource. A tag is a key-value pair that adds as a
metadata to a resource. For more information, see  Tagging your resources.

# Arguments
- `resource_arn`: The Amazon Resource Name (ARN) of the given Amazon Translate resource to
  which you want to associate the tags.
- `tags`: Tags being associated with a specific Amazon Translate resource. There can be a
  maximum of 50 tags (both existing and pending) associated with a specific resource.

"""
function tag_resource(ResourceArn, Tags; aws_config::AbstractAWSConfig=global_aws_config())
    return translate(
        "TagResource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "Tags" => Tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    ResourceArn,
    Tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "TagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "Tags" => Tags),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    translate_document(document, source_language_code, target_language_code)
    translate_document(document, source_language_code, target_language_code, params::Dict{String,<:Any})

Translates the input document from the source language to the target language. This
synchronous operation supports plain text or HTML for the input document. TranslateDocument
supports translations from English to any supported language, and from any supported
language to English. Therefore, specify either the source language code or the target
language code as “en” (English).   TranslateDocument does not support language
auto-detection.   If you set the Formality parameter, the request will fail if the target
language does not support formality. For a list of target languages that support formality,
see Setting formality.

# Arguments
- `document`: The content and content type for the document to be translated. The document
  size must not exceed 100 KB.
- `source_language_code`: The language code for the language of the source text. Do not use
  auto, because TranslateDocument does not support language auto-detection. For a list of
  supported language codes, see Supported languages.
- `target_language_code`: The language code requested for the translated document. For a
  list of supported language codes, see Supported languages.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Settings"`:
- `"TerminologyNames"`: The name of a terminology list file to add to the translation job.
  This file provides source terms and the desired translation for each term. A terminology
  list can contain a maximum of 256 terms. You can use one custom terminology resource in
  your translation request. Use the ListTerminologies operation to get the available
  terminology lists. For more information about custom terminology lists, see Custom
  terminology.
"""
function translate_document(
    Document,
    SourceLanguageCode,
    TargetLanguageCode;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "TranslateDocument",
        Dict{String,Any}(
            "Document" => Document,
            "SourceLanguageCode" => SourceLanguageCode,
            "TargetLanguageCode" => TargetLanguageCode,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function translate_document(
    Document,
    SourceLanguageCode,
    TargetLanguageCode,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "TranslateDocument",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "Document" => Document,
                    "SourceLanguageCode" => SourceLanguageCode,
                    "TargetLanguageCode" => TargetLanguageCode,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    translate_text(source_language_code, target_language_code, text)
    translate_text(source_language_code, target_language_code, text, params::Dict{String,<:Any})

Translates input text from the source language to the target language. For a list of
available languages and language codes, see Supported languages.

# Arguments
- `source_language_code`: The language code for the language of the source text. For a list
  of language codes, see Supported languages. To have Amazon Translate determine the source
  language of your text, you can specify auto in the SourceLanguageCode field. If you specify
  auto, Amazon Translate will call Amazon Comprehend to determine the source language.  If
  you specify auto, you must send the TranslateText request in a region that supports Amazon
  Comprehend. Otherwise, the request returns an error indicating that autodetect is not
  supported.
- `target_language_code`: The language code requested for the language of the target text.
  For a list of language codes, see Supported languages.
- `text`: The text to translate. The text string can be a maximum of 10,000 bytes long.
  Depending on your character set, this may be fewer than 10,000 characters.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Settings"`: Settings to configure your translation output, including the option to set
  the formality level of the output text and the option to mask profane words and phrases.
- `"TerminologyNames"`: The name of a terminology list file to add to the translation job.
  This file provides source terms and the desired translation for each term. A terminology
  list can contain a maximum of 256 terms. You can use one custom terminology resource in
  your translation request. Use the ListTerminologies operation to get the available
  terminology lists. For more information about custom terminology lists, see Custom
  terminology.
"""
function translate_text(
    SourceLanguageCode,
    TargetLanguageCode,
    Text;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "TranslateText",
        Dict{String,Any}(
            "SourceLanguageCode" => SourceLanguageCode,
            "TargetLanguageCode" => TargetLanguageCode,
            "Text" => Text,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function translate_text(
    SourceLanguageCode,
    TargetLanguageCode,
    Text,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "TranslateText",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "SourceLanguageCode" => SourceLanguageCode,
                    "TargetLanguageCode" => TargetLanguageCode,
                    "Text" => Text,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    untag_resource(resource_arn, tag_keys)
    untag_resource(resource_arn, tag_keys, params::Dict{String,<:Any})

Removes a specific tag associated with an Amazon Translate resource. For more information,
see  Tagging your resources.

# Arguments
- `resource_arn`:  The Amazon Resource Name (ARN) of the given Amazon Translate resource
  from which you want to remove the tags.
- `tag_keys`: The initial part of a key-value pair that forms a tag being removed from a
  given resource. Keys must be unique and cannot be duplicated for a particular resource.

"""
function untag_resource(
    ResourceArn, TagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "UntagResource",
        Dict{String,Any}("ResourceArn" => ResourceArn, "TagKeys" => TagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    ResourceArn,
    TagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "UntagResource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceArn" => ResourceArn, "TagKeys" => TagKeys),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_parallel_data(client_token, name, parallel_data_config)
    update_parallel_data(client_token, name, parallel_data_config, params::Dict{String,<:Any})

Updates a previously created parallel data resource by importing a new input file from
Amazon S3.

# Arguments
- `client_token`: A unique identifier for the request. This token is automatically
  generated when you use Amazon Translate through an AWS SDK.
- `name`: The name of the parallel data resource being updated.
- `parallel_data_config`: Specifies the format and S3 location of the parallel data input
  file.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Description"`: A custom description for the parallel data resource in Amazon Translate.
"""
function update_parallel_data(
    ClientToken, Name, ParallelDataConfig; aws_config::AbstractAWSConfig=global_aws_config()
)
    return translate(
        "UpdateParallelData",
        Dict{String,Any}(
            "ClientToken" => ClientToken,
            "Name" => Name,
            "ParallelDataConfig" => ParallelDataConfig,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_parallel_data(
    ClientToken,
    Name,
    ParallelDataConfig,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return translate(
        "UpdateParallelData",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ClientToken" => ClientToken,
                    "Name" => Name,
                    "ParallelDataConfig" => ParallelDataConfig,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

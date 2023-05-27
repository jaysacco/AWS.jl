# This file is auto-generated by AWSMetadata.jl
using AWS
using AWS.AWSServices: chime_sdk_identity
using AWS.Compat
using AWS.UUIDs

"""
    create_app_instance(client_request_token, name)
    create_app_instance(client_request_token, name, params::Dict{String,<:Any})

Creates an Amazon Chime SDK messaging AppInstance under an AWS account. Only SDK messaging
customers use this API. CreateAppInstance supports idempotency behavior as described in the
AWS API Standard. identity

# Arguments
- `client_request_token`: The unique ID of the request. Use different tokens to create
  different AppInstances.
- `name`: The name of the AppInstance.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Metadata"`: The metadata of the AppInstance. Limited to a 1KB string in UTF-8.
- `"Tags"`: Tags assigned to the AppInstance.
"""
function create_app_instance(
    ClientRequestToken, Name; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "POST",
        "/app-instances",
        Dict{String,Any}("ClientRequestToken" => ClientRequestToken, "Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_app_instance(
    ClientRequestToken,
    Name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/app-instances",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ClientRequestToken" => ClientRequestToken, "Name" => Name
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_app_instance_admin(app_instance_admin_arn, app_instance_arn)
    create_app_instance_admin(app_instance_admin_arn, app_instance_arn, params::Dict{String,<:Any})

Promotes an AppInstanceUser or AppInstanceBot to an AppInstanceAdmin. The promoted entity
can perform the following actions.     ChannelModerator actions across all channels in the
AppInstance.    DeleteChannelMessage actions.   Only an AppInstanceUser and AppInstanceBot
can be promoted to an AppInstanceAdmin role.

# Arguments
- `app_instance_admin_arn`: The ARN of the administrator of the current AppInstance.
- `app_instance_arn`: The ARN of the AppInstance.

"""
function create_app_instance_admin(
    AppInstanceAdminArn, appInstanceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "POST",
        "/app-instances/$(appInstanceArn)/admins",
        Dict{String,Any}("AppInstanceAdminArn" => AppInstanceAdminArn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_app_instance_admin(
    AppInstanceAdminArn,
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/app-instances/$(appInstanceArn)/admins",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("AppInstanceAdminArn" => AppInstanceAdminArn),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_app_instance_bot(app_instance_arn, client_request_token, configuration)
    create_app_instance_bot(app_instance_arn, client_request_token, configuration, params::Dict{String,<:Any})

Creates a bot under an Amazon Chime AppInstance. The request consists of a unique
Configuration and Name for that bot.

# Arguments
- `app_instance_arn`: The ARN of the AppInstance request.
- `client_request_token`: The unique ID for the client making the request. Use different
  tokens for different AppInstanceBots.
- `configuration`: Configuration information about the Amazon Lex V2 V2 bot.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"Metadata"`: The request metadata. Limited to a 1KB string in UTF-8.
- `"Name"`: The user's name.
- `"Tags"`: The tags assigned to the AppInstanceBot.
"""
function create_app_instance_bot(
    AppInstanceArn,
    ClientRequestToken,
    Configuration;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/app-instance-bots",
        Dict{String,Any}(
            "AppInstanceArn" => AppInstanceArn,
            "ClientRequestToken" => ClientRequestToken,
            "Configuration" => Configuration,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_app_instance_bot(
    AppInstanceArn,
    ClientRequestToken,
    Configuration,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/app-instance-bots",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AppInstanceArn" => AppInstanceArn,
                    "ClientRequestToken" => ClientRequestToken,
                    "Configuration" => Configuration,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    create_app_instance_user(app_instance_arn, app_instance_user_id, client_request_token, name)
    create_app_instance_user(app_instance_arn, app_instance_user_id, client_request_token, name, params::Dict{String,<:Any})

Creates a user under an Amazon Chime AppInstance. The request consists of a unique
appInstanceUserId and Name for that user.

# Arguments
- `app_instance_arn`: The ARN of the AppInstance request.
- `app_instance_user_id`: The user ID of the AppInstance.
- `client_request_token`: The unique ID of the request. Use different tokens to request
  additional AppInstances.
- `name`: The user's name.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ExpirationSettings"`: Settings that control the interval after which the
  AppInstanceUser is automatically deleted.
- `"Metadata"`: The request's metadata. Limited to a 1KB string in UTF-8.
- `"Tags"`: Tags assigned to the AppInstanceUser.
"""
function create_app_instance_user(
    AppInstanceArn,
    AppInstanceUserId,
    ClientRequestToken,
    Name;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/app-instance-users",
        Dict{String,Any}(
            "AppInstanceArn" => AppInstanceArn,
            "AppInstanceUserId" => AppInstanceUserId,
            "ClientRequestToken" => ClientRequestToken,
            "Name" => Name,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function create_app_instance_user(
    AppInstanceArn,
    AppInstanceUserId,
    ClientRequestToken,
    Name,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/app-instance-users",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AppInstanceArn" => AppInstanceArn,
                    "AppInstanceUserId" => AppInstanceUserId,
                    "ClientRequestToken" => ClientRequestToken,
                    "Name" => Name,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_app_instance(app_instance_arn)
    delete_app_instance(app_instance_arn, params::Dict{String,<:Any})

Deletes an AppInstance and all associated data asynchronously.

# Arguments
- `app_instance_arn`: The ARN of the AppInstance.

"""
function delete_app_instance(
    appInstanceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instances/$(appInstanceArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_app_instance(
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instances/$(appInstanceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_app_instance_admin(app_instance_admin_arn, app_instance_arn)
    delete_app_instance_admin(app_instance_admin_arn, app_instance_arn, params::Dict{String,<:Any})

Demotes an AppInstanceAdmin to an AppInstanceUser or AppInstanceBot. This action does not
delete the user.

# Arguments
- `app_instance_admin_arn`: The ARN of the AppInstance's administrator.
- `app_instance_arn`: The ARN of the AppInstance.

"""
function delete_app_instance_admin(
    appInstanceAdminArn, appInstanceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instances/$(appInstanceArn)/admins/$(appInstanceAdminArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_app_instance_admin(
    appInstanceAdminArn,
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instances/$(appInstanceArn)/admins/$(appInstanceAdminArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_app_instance_bot(app_instance_bot_arn)
    delete_app_instance_bot(app_instance_bot_arn, params::Dict{String,<:Any})

Deletes an AppInstanceBot.

# Arguments
- `app_instance_bot_arn`: The ARN of the AppInstanceBot being deleted.

"""
function delete_app_instance_bot(
    appInstanceBotArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instance-bots/$(appInstanceBotArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_app_instance_bot(
    appInstanceBotArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instance-bots/$(appInstanceBotArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    delete_app_instance_user(app_instance_user_arn)
    delete_app_instance_user(app_instance_user_arn, params::Dict{String,<:Any})

Deletes an AppInstanceUser.

# Arguments
- `app_instance_user_arn`: The ARN of the user request being deleted.

"""
function delete_app_instance_user(
    appInstanceUserArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instance-users/$(appInstanceUserArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function delete_app_instance_user(
    appInstanceUserArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instance-users/$(appInstanceUserArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    deregister_app_instance_user_endpoint(app_instance_user_arn, endpoint_id)
    deregister_app_instance_user_endpoint(app_instance_user_arn, endpoint_id, params::Dict{String,<:Any})

Deregisters an AppInstanceUserEndpoint.

# Arguments
- `app_instance_user_arn`: The ARN of the AppInstanceUser.
- `endpoint_id`: The unique identifier of the AppInstanceUserEndpoint.

"""
function deregister_app_instance_user_endpoint(
    appInstanceUserArn, endpointId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instance-users/$(appInstanceUserArn)/endpoints/$(endpointId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function deregister_app_instance_user_endpoint(
    appInstanceUserArn,
    endpointId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "DELETE",
        "/app-instance-users/$(appInstanceUserArn)/endpoints/$(endpointId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_app_instance(app_instance_arn)
    describe_app_instance(app_instance_arn, params::Dict{String,<:Any})

Returns the full details of an AppInstance.

# Arguments
- `app_instance_arn`: The ARN of the AppInstance.

"""
function describe_app_instance(
    appInstanceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instances/$(appInstanceArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_app_instance(
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instances/$(appInstanceArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_app_instance_admin(app_instance_admin_arn, app_instance_arn)
    describe_app_instance_admin(app_instance_admin_arn, app_instance_arn, params::Dict{String,<:Any})

Returns the full details of an AppInstanceAdmin.

# Arguments
- `app_instance_admin_arn`: The ARN of the AppInstanceAdmin.
- `app_instance_arn`: The ARN of the AppInstance.

"""
function describe_app_instance_admin(
    appInstanceAdminArn, appInstanceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instances/$(appInstanceArn)/admins/$(appInstanceAdminArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_app_instance_admin(
    appInstanceAdminArn,
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instances/$(appInstanceArn)/admins/$(appInstanceAdminArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_app_instance_bot(app_instance_bot_arn)
    describe_app_instance_bot(app_instance_bot_arn, params::Dict{String,<:Any})

The AppInstanceBot's information.

# Arguments
- `app_instance_bot_arn`: The ARN of the AppInstanceBot.

"""
function describe_app_instance_bot(
    appInstanceBotArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-bots/$(appInstanceBotArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_app_instance_bot(
    appInstanceBotArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-bots/$(appInstanceBotArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_app_instance_user(app_instance_user_arn)
    describe_app_instance_user(app_instance_user_arn, params::Dict{String,<:Any})

Returns the full details of an AppInstanceUser.

# Arguments
- `app_instance_user_arn`: The ARN of the AppInstanceUser.

"""
function describe_app_instance_user(
    appInstanceUserArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-users/$(appInstanceUserArn)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_app_instance_user(
    appInstanceUserArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-users/$(appInstanceUserArn)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    describe_app_instance_user_endpoint(app_instance_user_arn, endpoint_id)
    describe_app_instance_user_endpoint(app_instance_user_arn, endpoint_id, params::Dict{String,<:Any})

Returns the full details of an AppInstanceUserEndpoint.

# Arguments
- `app_instance_user_arn`: The ARN of the AppInstanceUser.
- `endpoint_id`: The unique identifier of the AppInstanceUserEndpoint.

"""
function describe_app_instance_user_endpoint(
    appInstanceUserArn, endpointId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-users/$(appInstanceUserArn)/endpoints/$(endpointId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function describe_app_instance_user_endpoint(
    appInstanceUserArn,
    endpointId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-users/$(appInstanceUserArn)/endpoints/$(endpointId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    get_app_instance_retention_settings(app_instance_arn)
    get_app_instance_retention_settings(app_instance_arn, params::Dict{String,<:Any})

Gets the retention settings for an AppInstance.

# Arguments
- `app_instance_arn`: The ARN of the AppInstance.

"""
function get_app_instance_retention_settings(
    appInstanceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instances/$(appInstanceArn)/retention-settings";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function get_app_instance_retention_settings(
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instances/$(appInstanceArn)/retention-settings",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_app_instance_admins(app_instance_arn)
    list_app_instance_admins(app_instance_arn, params::Dict{String,<:Any})

Returns a list of the administrators in the AppInstance.

# Arguments
- `app_instance_arn`: The ARN of the AppInstance.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max-results"`: The maximum number of administrators that you want to return.
- `"next-token"`: The token returned from previous API requests until the number of
  administrators is reached.
"""
function list_app_instance_admins(
    appInstanceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instances/$(appInstanceArn)/admins";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_app_instance_admins(
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instances/$(appInstanceArn)/admins",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_app_instance_bots(app-instance-arn)
    list_app_instance_bots(app-instance-arn, params::Dict{String,<:Any})

Lists all AppInstanceBots created under a single AppInstance.

# Arguments
- `app-instance-arn`: The ARN of the AppInstance.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max-results"`: The maximum number of requests to return.
- `"next-token"`: The token passed by previous API calls until all requested bots are
  returned.
"""
function list_app_instance_bots(
    app_instance_arn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-bots",
        Dict{String,Any}("app-instance-arn" => app_instance_arn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_app_instance_bots(
    app_instance_arn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-bots",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("app-instance-arn" => app_instance_arn), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_app_instance_user_endpoints(app_instance_user_arn)
    list_app_instance_user_endpoints(app_instance_user_arn, params::Dict{String,<:Any})

Lists all the AppInstanceUserEndpoints created under a single AppInstanceUser.

# Arguments
- `app_instance_user_arn`: The ARN of the AppInstanceUser.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max-results"`: The maximum number of endpoints that you want to return.
- `"next-token"`: The token passed by previous API calls until all requested endpoints are
  returned.
"""
function list_app_instance_user_endpoints(
    appInstanceUserArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-users/$(appInstanceUserArn)/endpoints";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_app_instance_user_endpoints(
    appInstanceUserArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-users/$(appInstanceUserArn)/endpoints",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_app_instance_users(app-instance-arn)
    list_app_instance_users(app-instance-arn, params::Dict{String,<:Any})

List all AppInstanceUsers created under a single AppInstance.

# Arguments
- `app-instance-arn`: The ARN of the AppInstance.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max-results"`: The maximum number of requests that you want returned.
- `"next-token"`: The token passed by previous API calls until all requested users are
  returned.
"""
function list_app_instance_users(
    app_instance_arn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-users",
        Dict{String,Any}("app-instance-arn" => app_instance_arn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_app_instance_users(
    app_instance_arn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "GET",
        "/app-instance-users",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("app-instance-arn" => app_instance_arn), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_app_instances()
    list_app_instances(params::Dict{String,<:Any})

Lists all Amazon Chime AppInstances created under a single AWS account.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"max-results"`: The maximum number of AppInstances that you want to return.
- `"next-token"`: The token passed by previous API requests until you reach the maximum
  number of AppInstances.
"""
function list_app_instances(; aws_config::AbstractAWSConfig=global_aws_config())
    return chime_sdk_identity(
        "GET", "/app-instances"; aws_config=aws_config, feature_set=SERVICE_FEATURE_SET
    )
end
function list_app_instances(
    params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/app-instances",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    list_tags_for_resource(arn)
    list_tags_for_resource(arn, params::Dict{String,<:Any})

Lists the tags applied to an Amazon Chime SDK identity resource.

# Arguments
- `arn`: The ARN of the resource.

"""
function list_tags_for_resource(arn; aws_config::AbstractAWSConfig=global_aws_config())
    return chime_sdk_identity(
        "GET",
        "/tags",
        Dict{String,Any}("arn" => arn);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function list_tags_for_resource(
    arn, params::AbstractDict{String}; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "GET",
        "/tags",
        Dict{String,Any}(mergewith(_merge, Dict{String,Any}("arn" => arn), params));
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_app_instance_retention_settings(app_instance_retention_settings, app_instance_arn)
    put_app_instance_retention_settings(app_instance_retention_settings, app_instance_arn, params::Dict{String,<:Any})

Sets the amount of time in days that a given AppInstance retains data.

# Arguments
- `app_instance_retention_settings`: The time in days to retain data. Data type: number.
- `app_instance_arn`: The ARN of the AppInstance.

"""
function put_app_instance_retention_settings(
    AppInstanceRetentionSettings,
    appInstanceArn;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "PUT",
        "/app-instances/$(appInstanceArn)/retention-settings",
        Dict{String,Any}("AppInstanceRetentionSettings" => AppInstanceRetentionSettings);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function put_app_instance_retention_settings(
    AppInstanceRetentionSettings,
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "PUT",
        "/app-instances/$(appInstanceArn)/retention-settings",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "AppInstanceRetentionSettings" => AppInstanceRetentionSettings
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    put_app_instance_user_expiration_settings(app_instance_user_arn)
    put_app_instance_user_expiration_settings(app_instance_user_arn, params::Dict{String,<:Any})

Sets the number of days before the AppInstanceUser is automatically deleted.  A background
process deletes expired AppInstanceUsers within 6 hours of expiration. Actual deletion
times may vary. Expired AppInstanceUsers that have not yet been deleted appear as active,
and you can update their expiration settings. The system honors the new settings.

# Arguments
- `app_instance_user_arn`: The ARN of the AppInstanceUser.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"ExpirationSettings"`: Settings that control the interval after which an AppInstanceUser
  is automatically deleted.
"""
function put_app_instance_user_expiration_settings(
    appInstanceUserArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "PUT",
        "/app-instance-users/$(appInstanceUserArn)/expiration-settings";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function put_app_instance_user_expiration_settings(
    appInstanceUserArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "PUT",
        "/app-instance-users/$(appInstanceUserArn)/expiration-settings",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    register_app_instance_user_endpoint(client_request_token, endpoint_attributes, resource_arn, type, app_instance_user_arn)
    register_app_instance_user_endpoint(client_request_token, endpoint_attributes, resource_arn, type, app_instance_user_arn, params::Dict{String,<:Any})

Registers an endpoint under an Amazon Chime AppInstanceUser. The endpoint receives messages
for a user. For push notifications, the endpoint is a mobile device used to receive mobile
push notifications for a user.

# Arguments
- `client_request_token`: The unique ID assigned to the request. Use different tokens to
  register other endpoints.
- `endpoint_attributes`: The attributes of an Endpoint.
- `resource_arn`: The ARN of the resource to which the endpoint belongs.
- `type`: The type of the AppInstanceUserEndpoint. Supported types:    APNS: The mobile
  notification service for an Apple device.    APNS_SANDBOX: The sandbox environment of the
  mobile notification service for an Apple device.    GCM: The mobile notification service
  for an Android device.   Populate the ResourceArn value of each type as PinpointAppArn.
- `app_instance_user_arn`: The ARN of the AppInstanceUser.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"AllowMessages"`: Boolean that controls whether the AppInstanceUserEndpoint is opted in
  to receive messages. ALL indicates the endpoint receives all messages. NONE indicates the
  endpoint receives no messages.
- `"Name"`: The name of the AppInstanceUserEndpoint.
"""
function register_app_instance_user_endpoint(
    ClientRequestToken,
    EndpointAttributes,
    ResourceArn,
    Type,
    appInstanceUserArn;
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/app-instance-users/$(appInstanceUserArn)/endpoints",
        Dict{String,Any}(
            "ClientRequestToken" => ClientRequestToken,
            "EndpointAttributes" => EndpointAttributes,
            "ResourceArn" => ResourceArn,
            "Type" => Type,
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function register_app_instance_user_endpoint(
    ClientRequestToken,
    EndpointAttributes,
    ResourceArn,
    Type,
    appInstanceUserArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/app-instance-users/$(appInstanceUserArn)/endpoints",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}(
                    "ClientRequestToken" => ClientRequestToken,
                    "EndpointAttributes" => EndpointAttributes,
                    "ResourceArn" => ResourceArn,
                    "Type" => Type,
                ),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    tag_resource(resource_arn, tags)
    tag_resource(resource_arn, tags, params::Dict{String,<:Any})

Applies the specified tags to the specified Amazon Chime SDK identity resource.

# Arguments
- `resource_arn`: The resource ARN.
- `tags`: The tag key-value pairs.

"""
function tag_resource(ResourceARN, Tags; aws_config::AbstractAWSConfig=global_aws_config())
    return chime_sdk_identity(
        "POST",
        "/tags?operation=tag-resource",
        Dict{String,Any}("ResourceARN" => ResourceARN, "Tags" => Tags);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function tag_resource(
    ResourceARN,
    Tags,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/tags?operation=tag-resource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceARN" => ResourceARN, "Tags" => Tags),
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

Removes the specified tags from the specified Amazon Chime SDK identity resource.

# Arguments
- `resource_arn`: The resource ARN.
- `tag_keys`: The tag keys.

"""
function untag_resource(
    ResourceARN, TagKeys; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "POST",
        "/tags?operation=untag-resource",
        Dict{String,Any}("ResourceARN" => ResourceARN, "TagKeys" => TagKeys);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function untag_resource(
    ResourceARN,
    TagKeys,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "POST",
        "/tags?operation=untag-resource",
        Dict{String,Any}(
            mergewith(
                _merge,
                Dict{String,Any}("ResourceARN" => ResourceARN, "TagKeys" => TagKeys),
                params,
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_app_instance(metadata, name, app_instance_arn)
    update_app_instance(metadata, name, app_instance_arn, params::Dict{String,<:Any})

Updates AppInstance metadata.

# Arguments
- `metadata`: The metadata that you want to change.
- `name`: The name that you want to change.
- `app_instance_arn`: The ARN of the AppInstance.

"""
function update_app_instance(
    Metadata, Name, appInstanceArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "PUT",
        "/app-instances/$(appInstanceArn)",
        Dict{String,Any}("Metadata" => Metadata, "Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_app_instance(
    Metadata,
    Name,
    appInstanceArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "PUT",
        "/app-instances/$(appInstanceArn)",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("Metadata" => Metadata, "Name" => Name), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_app_instance_bot(metadata, name, app_instance_bot_arn)
    update_app_instance_bot(metadata, name, app_instance_bot_arn, params::Dict{String,<:Any})

Updates the name and metadata of an AppInstanceBot.

# Arguments
- `metadata`: The metadata of the AppInstanceBot.
- `name`: The name of the AppInstanceBot.
- `app_instance_bot_arn`: The ARN of the AppInstanceBot.

"""
function update_app_instance_bot(
    Metadata, Name, appInstanceBotArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "PUT",
        "/app-instance-bots/$(appInstanceBotArn)",
        Dict{String,Any}("Metadata" => Metadata, "Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_app_instance_bot(
    Metadata,
    Name,
    appInstanceBotArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "PUT",
        "/app-instance-bots/$(appInstanceBotArn)",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("Metadata" => Metadata, "Name" => Name), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_app_instance_user(metadata, name, app_instance_user_arn)
    update_app_instance_user(metadata, name, app_instance_user_arn, params::Dict{String,<:Any})

Updates the details of an AppInstanceUser. You can update names and metadata.

# Arguments
- `metadata`: The metadata of the AppInstanceUser.
- `name`: The name of the AppInstanceUser.
- `app_instance_user_arn`: The ARN of the AppInstanceUser.

"""
function update_app_instance_user(
    Metadata, Name, appInstanceUserArn; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "PUT",
        "/app-instance-users/$(appInstanceUserArn)",
        Dict{String,Any}("Metadata" => Metadata, "Name" => Name);
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_app_instance_user(
    Metadata,
    Name,
    appInstanceUserArn,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "PUT",
        "/app-instance-users/$(appInstanceUserArn)",
        Dict{String,Any}(
            mergewith(
                _merge, Dict{String,Any}("Metadata" => Metadata, "Name" => Name), params
            ),
        );
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

"""
    update_app_instance_user_endpoint(app_instance_user_arn, endpoint_id)
    update_app_instance_user_endpoint(app_instance_user_arn, endpoint_id, params::Dict{String,<:Any})

Updates the details of an AppInstanceUserEndpoint. You can update the name and AllowMessage
values.

# Arguments
- `app_instance_user_arn`: The ARN of the AppInstanceUser.
- `endpoint_id`: The unique identifier of the AppInstanceUserEndpoint.

# Optional Parameters
Optional parameters can be passed as a `params::Dict{String,<:Any}`. Valid keys are:
- `"AllowMessages"`: Boolean that controls whether the AppInstanceUserEndpoint is opted in
  to receive messages. ALL indicates the endpoint will receive all messages. NONE indicates
  the endpoint will receive no messages.
- `"Name"`: The name of the AppInstanceUserEndpoint.
"""
function update_app_instance_user_endpoint(
    appInstanceUserArn, endpointId; aws_config::AbstractAWSConfig=global_aws_config()
)
    return chime_sdk_identity(
        "PUT",
        "/app-instance-users/$(appInstanceUserArn)/endpoints/$(endpointId)";
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end
function update_app_instance_user_endpoint(
    appInstanceUserArn,
    endpointId,
    params::AbstractDict{String};
    aws_config::AbstractAWSConfig=global_aws_config(),
)
    return chime_sdk_identity(
        "PUT",
        "/app-instance-users/$(appInstanceUserArn)/endpoints/$(endpointId)",
        params;
        aws_config=aws_config,
        feature_set=SERVICE_FEATURE_SET,
    )
end

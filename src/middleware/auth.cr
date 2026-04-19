# Middleware for authentication checking for api key

require "json"
require "../services/apiKeyValidator.service.cr"

# Module for middleware, checks env and calls validator
module AuthMiddleware

    # Authenticates key
    def self.call(env)
        puts "Headers: #{env.request.headers.inspect}"
        api_key = extract_api_key(env)

        unless api_key
            env.response.status_code = 401
            return env.response.print("Missing API Key")
        end

        
        unless ApiKeyValidator.valid?(api_key)
            env.response.status_code = 401
            return env.response.print("Invalid API Key")
        end

        # Implement project Id and validation later.
        # project_id = ApiKeyValidator.validate_and_getproject(api_key)

        #unless project_id
        #    env.response.status_code = 401
        #    return env.response.print("Invalid API Key")
        #end

        # Implement project id extraction later
        # env.set "project_id", project_id

        # attached for future use
        # env.set "api_key", api_key
    end

    # Extracts api key from env
    def self.extract_api_key(env)
        auth = env.request.headers["Authorization"]?
        puts "Auth header: #{auth.inspect}"
        return nil unless auth

        api_key = auth.gsub("Bearer ", "")
        puts "API key: #{api_key.inspect}"
        api_key
    end
end
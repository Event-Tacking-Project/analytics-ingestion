###
# Middleware module for API key authentication.
# Provides methods to check and extract API keys from HTTP requests.
###
module AuthMiddleware

    ###
    # Authenticates the API key from the request environment.
    # Returns :valid if the key is present and valid,
    # :missing if no key is provided, or :invalid if the key is incorrect.
    #
    # env - The HTTP::Server::Context environment.
    ###
    def self.authenticate(env)
        api_key = extract_api_key(env)

        return :missing unless api_key
        
        return :invalid unless ApiKeyValidator.valid?(api_key)

        :valid
    end

    ###
    # Extracts the API key from the Authorization header.
    # Assumes Bearer token format and strips the "Bearer " prefix.
    #
    # env - The HTTP::Server::Context environment.
    # Returns the API key as a string or nil if not present.
    ###
    def self.extract_api_key(env)
        auth = env.request.headers["Authorization"]?
        return nil unless auth

        auth.gsub("Bearer ", "")
    end
end
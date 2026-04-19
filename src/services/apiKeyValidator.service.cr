# Api key validation service
# validates api keys to see if they are valid
# ADD redis key
# ADD DB checking
# Implement Project ID extraction

# NOTICE: Currently in development so keys cant ge generated

require "../config/env.cr"

###
# Service class for validating API keys.
# Currently checks against a static list of keys; future versions will support
# database or Redis lookups and project ID extraction.
###
class ApiKeyValidator
    ###
    # Checks if the provided API key is valid.
    # Compares against the list of allowed keys from environment configuration.
    #
    # key - The API key string to validate.
    # Returns true if valid, false otherwise.
    ###
    def self.valid?(key : String)
        ENV_API_KEYS.includes?(key)
    end
end
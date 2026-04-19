# Api key validation service
# validates api keys to see if they are valid
# ADD redis key
# ADD DB checking
# Implement Project ID extraction

# NOTICE: Currently in development so keys cant ge generated

require "../config/env.cr"

# VALID_KEYS holds current keys to compare. This will be modified to pull from DB
class ApiKeyValidator
    # Checks inputted key if its valid
    def self.valid?(key : String)
        ENV_API_KEYS.includes?(key)
    end
end
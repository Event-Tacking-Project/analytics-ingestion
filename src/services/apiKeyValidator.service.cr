# Api key validation service
# validates api keys to see if they are valid
# ADD redis key

# NOTICE: Currently in development so keys cant ge generated

# VALID_KEYS holds current keys to compare. This will be modified to pull from DB
class ApiKeyValidator
    VALID_KEYS = ["test_key_123"]

    # Checks inputted key if its valid
    def self.valid?(key : String)
        VALID_KEYS.includes?(key)
    end
end
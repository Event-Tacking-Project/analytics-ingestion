require "kemal"
require "./services/apiKeyValidator.service.cr"
require "./middleware/auth.cr"

###
# The main namespace for the Analytics Ingestion application.
# This module contains constants and can hold classes, sub-modules, and methods
# related to analytics data processing and ingestion.
###
module Analytics::Ingestion
  ###
  # The version of the Analytics Ingestion application.
  ###
  VERSION = "0.2.0"

  # TODO: Put your code here
end

###
# Global filter that runs before every request to authenticate API keys.
# Checks for valid API keys and halts with 401 if missing or invalid.
###
before_all do |env|
  case AuthMiddleware.authenticate(env)
  when :missing
    halt env, 401, "Missing API Key"
  when :invalid
    halt env, 401, "Invalid API Key"
  end

  # Implement project Id and validation later.
  # project_id = ApiKeyValidator.validate_and_getproject(api_key)

  #unless project_id
  #    halt env, 401, "Invalid API Key"
  #end

  # Implement project id extraction later
  # env.set "project_id", project_id

  # attached for future use
  # env.set "api_key", api_key
end

###
# Extracts the API key from the Authorization header.
# Returns the key as a string or nil if not present.
#
# env - The HTTP::Server::Context environment.
###
def extract_api_key(env)
  auth = env.request.headers["Authorization"]?
  return nil unless auth

  auth.gsub("Bearer ", "")
end

# routes imported after authentication
require "./routes/track.routes.cr"

###
# Health check endpoint that returns a simple status message.
# This endpoint is protected by the before_all filter.
###
get "/health" do
  "OK - Up"
end

###
# Starts the Kemal web server.
# This is the entry point that begins listening for HTTP requests.
###
Kemal.run

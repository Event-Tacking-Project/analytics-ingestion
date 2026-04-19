require "kemal"
require "./middleware/auth.cr"

# TODO: Write documentation for `Analytics::Ingestion`
module Analytics::Ingestion
  VERSION = "0.1.0"

  # TODO: Put your code here
end

before_all do |env|
  AuthMiddleware.call(env)
end

require "./routes/track.routes.cr"

get "/health" do
  "OK - Up"
end

Kemal.run

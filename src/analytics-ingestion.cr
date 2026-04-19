require "kemal"
require "./routes/track.routes.cr"

# TODO: Write documentation for `Analytics::Ingestion`
module Analytics::Ingestion
  VERSION = "0.1.0"

  # TODO: Put your code here
  Kemal.run
end

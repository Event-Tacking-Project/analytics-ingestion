require "kemal"

# TODO: Write documentation for `Analytics::Ingestion`
module Analytics::Ingestion
  VERSION = "0.1.0"

  # TODO: Put your code here
  get "/" do
    "Hello World!"
  end

  Kemal.run
end

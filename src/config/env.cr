# Config for env
# This is for api key testing

ENV_API_KEYS = ENV["VALID_API_KEYS"]?.try(&.split(",")) || ["test_key_123"]
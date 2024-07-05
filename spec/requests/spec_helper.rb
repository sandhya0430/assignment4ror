RSpec.configure do |config|
  # other configuration options...
  config.include RequestSpecHelper, type: :request
end
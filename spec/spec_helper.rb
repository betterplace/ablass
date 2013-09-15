ENV["RAILS_ENV"] = 'test'
require 'simplecov'
if ENV['START_SIMPLECOV'].to_i != 0
  require 'fileutils'
  SimpleCov.start 'rails' # default to NOT starting
end

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

require 'capybara/rails'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Dir[Rails.root.join("spec/factories/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.include Rails.application.routes.url_helpers
  #config.include Devise::TestHelpers, type: :controller
  #config.include Devise::TestHelpers, type: :view
  #config.include Devise::TestHelpers, type: :helper

  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false

  config.before(:each) do
    SimpleCov.command_name "RSpec:#$$#{ENV['TEST_ENV_NUMBER']}"
  end

  config.before type: :request do
    switch_host 'http://test.host'
  end

  config.before(:each) do
    WebMock.disable_net_connect!
    I18n.locale = 'en'
  end
end

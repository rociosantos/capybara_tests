ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require "capybara"
require "capybara/dsl"
require 'capybara/poltergeist'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

Capybara.configure do |config|
  config.run_server = false
  config.app_host = 'http://google.com'
  config.ignore_hidden_elements = false
  config.default_max_wait_time = 30

  # config.register_driver :custom_poltergeist do |app|
  #   Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 180, phantomjs_options: ['--load-images=no', '--ignore-ssl-errors=yes'])
  # end
  # config.javascript_driver = :custom_poltergeist
  # config.default_driver = :custom_poltergeist

  config.register_driver :custom_selenium do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      desired_capabilities: Selenium::WebDriver::Remote::Capabilities.firefox(marionette: false)
    )
    end
  config.default_driver = :custom_selenium
end

class Minitest::Test
  include Capybara::DSL
end

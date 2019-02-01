require 'cucumber/rails'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require_relative './request_helper'

World(FactoryBot::Syntax::Methods)

Capybara.app_host = "http://#{ENV['TEST_APP_HOST']}:#{ENV['TEST_PORT']}"
Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :chrome

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group)'
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

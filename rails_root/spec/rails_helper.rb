ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start "rails"
end

require "spec_helper"
require "rspec/rails"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end

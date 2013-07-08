# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require "fileutils"
include FileUtils

cd(File.expand_path("../dummy/", __FILE__)) do
  puts "Dropping test database..."
  system("rake", "db:drop")
  puts "Recreating test database..."
  system("rake", "db:create")
  puts "Running migrations..."
  system("rake", "db:migrate")
  puts "Ready to run tests"
end

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

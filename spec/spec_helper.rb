$LOAD_PATH.unshift(File.dirname(__FILE__))

# Configure Rack Environment
ENV["RACK_ENV"] = "test"
ENV["APP_ROOT"] = File.expand_path(File.join(__dir__, "support"))

#require File.expand_path("../dummy/config/environment.rb", __FILE__)
require "active_support"
require "rspec"
require 'capybara/rspec'
require 'rake'

require_relative '../lib/apartment'
require_relative '../lib/apartment/reloader'

begin
  require 'pry'
rescue LoadError
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|

  config.include Apartment::Spec::Setup

  # Somewhat brutal hack so that rails 4 postgres extensions don't modify this file
  config.after(:suite) do
    #`git checkout -- spec/support/db/schema.rb`
  end
end

# Load shared examples, must happen after configure for RSpec 3
Dir["#{File.dirname(__FILE__)}/examples/**/*.rb"].each { |f| require f }

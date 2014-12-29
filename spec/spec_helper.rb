# Not strictly necessary with bundler, but good practice
require 'rubygems'

ROOT = File.absolute_path(File.dirname(__FILE__) + "/..")

# put lib/ on the load path used by require
$:.unshift "#{ROOT}/lib"

# pull in the library
require 'secrets_scanner'

# Pull in all of the files under spec/support
Dir["#{ROOT}/spec/support/**/*.rb"].each{|path| require path}

# Configure a few RSpec things
RSpec.configure do |config|
  # run the tests in random order.  You can reproduce the order of a
  # run by running rspec with --seed 1234, which is printed after each
  # run.
  config.order = "random"

  # TODO: you can setup any kind of reporting or whatever here
  # like
  # require 'simplecov'
  # SimpleCov.start 'secrets-scanner'
end


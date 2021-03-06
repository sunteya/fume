require 'bundler/setup'
require "simplecov"
require 'coveralls'
Coveralls.wear!
# SimpleCov.start

require 'combustion'
Combustion.initialize! :all
require 'rspec/rails'
require "rspec-do_action"

require "fume"
require "pry-nav"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
  config.before(:all) { FileUtils.mkdir_p File.expand_path("../../tmp/cache", __FILE__) } # ensure tmp/cache exists
end

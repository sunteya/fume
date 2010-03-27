require File.expand_path("../../depends.rb", __FILE__)
GemLoader.require(:runtime, :development)

require File.join(File.dirname(__FILE__), '..', 'lib', 'fume')
require "rails_stub"

include Fume

Spec::Runner.configure do |config|
  
end

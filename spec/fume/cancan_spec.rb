require "spec_helper"

describe Fume::Cancan do
  before(:each) do
    Fume::Cancan.try_enable
    @controller_class = Class.new(ActionController::Base)
  end

  it "should add method to action controller base" do
    @controller_class.methods.should be_include "authorize_namespace"
    @controller_class.instance_methods.should be_include "authorize_namespace"
  end
end
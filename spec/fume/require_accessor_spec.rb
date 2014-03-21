require "spec_helper"

describe Fume::RequireAccessor, type: :model do
  class Page < ActiveRecord::Base
    require_accessor :something
  end

  subject { Page.new }

  context 'default value' do
    its(:something_required?) { should eq false }
  end

  context '#require_something!' do
    before { subject.require_something! }
    its(:something_required?) { should eq true }
  end

end
require "spec_helper"

describe Fume::HelperExts, type: :helper do
  describe "#ok_url_tag" do
    subject { helper.ok_url_tag }

    context "then not ok_url params" do
      it { should eq nil }
    end

    context "then have ok_url" do
      before { params[:ok_url] = "/foo" }
      it { should include 'value="/foo"' }
    end
  end
end


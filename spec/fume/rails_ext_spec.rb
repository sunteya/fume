require "spec_helper"


describe Fume::RailsExt::ControllerExtensions, type: :controller do
  controller(ApplicationController) { }

  describe "#public_path" do
    before { request.script_name = "/context" }
    subject { controller.send(:public_path, source) }

    context "then source is full url" do
      let(:source) { "http://test.host/path" }
      it { should eq source }
    end

    context "then source is path" do
      let(:source) { "/path" }
      it { should eq "/context/path" }
    end

    context "then source already include script_name" do
      let(:source) { "/context/path" }
      it { should eq "/context/path" }
    end
  end

  describe "#public_url" do
    before { request.script_name = "/context" }
    subject { controller.send(:public_url, source) }

    context "then source is full url" do
      let(:source) { "http://test.host/path" }
      it { should eq source }
    end

    context "then source is path" do
      let(:source) { "/path" }
      it { should eq "http://test.host/context/path" }
    end
  end

  describe "#redirect_to_ok_url_or_default" do
    controller do
      def create
        redirect_to_ok_url_or_default "/foo"
      end
    end

    let(:params) { Hash.new }
    before { post :create, params }

    context "then no ok_url" do
      it { should redirect_to("/foo") }
    end

    context "then have ok_url" do
      let(:params) { { ok_url: "/bar" } }
      it { should redirect_to("/bar") }
    end
  end
end

describe Fume::RailsExt::HelperExtensions, type: :helper do
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


require "spec_helper"

describe Fume::RenderCache::ActiveRecordExtensions, type: :model do
  describe "#last_updated_at" do
    let!(:pages) { 10.times.map { Page.create } }
    it { expect(Page.last_updated_at).to eq pages[-1].reload.updated_at }
  end
end



describe Fume::RenderCache::ControllerExtensions, type: :controller do
  controller(ApplicationController) do
    def show
      render_cache("key", {}) do
        render text: "foo"
      end
    end
  end

  describe "#render_cache" do
    before { Rails.cache.clear }
    before { controller.class.perform_caching = true }
    after  { controller.class.perform_caching = false }

    let(:page) { Page.create content: "foo" }
    let(:key) { controller.send(:build_render_cache_key, "key") }
    before { get :show, id: page.id }

    it { expect(Rails.cache).to be_exist(key) }
  end

  describe "#key_to_string" do
    subject { controller.send(:key_to_string, obj) }

    context "obj is nil" do
      let(:obj) { nil }
      it { should eq "nil!" }
    end

    context "obj is array" do
      let(:obj) { [ 1, 2 ] }
      it { should eq "1,2" }
    end

    context "obj is hash" do
      let(:obj) { { a: 1, b: 2 } }
      it { should eq "a=1&b=2" }
    end

    context "obj is time" do
      let(:obj) { Time.parse("2014-03-21T04:28:12+0000") }
      it { should eq "2014-03-21T04:28:12Z" }
    end
  end

end
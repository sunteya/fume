require "spec_helper"

describe Fume::RenderCache::ActiveRecordExtensions, type: :model do
  describe "#last_updated_at" do
    let!(:pages) { 10.times.map { Page.create } }
    it { expect(Page.last_updated_at).to eq pages[-1].updated_at }
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
    before { controller.class.perform_caching = true }
    after  { controller.class.perform_caching = false }

    let(:page) { Page.create content: "foo" }
    let(:key) { controller.send(:build_render_cache_key, "key") }
    before { get :show, id: page.id }

    it { expect(Rails.cache).to be_exist(key) }
  end

end
module Fume
  module HelperExts
    def ok_url_tag
      hidden_field_tag "ok_url", params[:ok_url] if !params[:ok_url].blank?
    end
  end
end


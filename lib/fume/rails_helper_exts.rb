module Fume
  module RailsHelperExts
    
    def self.init!
      ::ActionView::Base.send :include, HelperExtensions if defined? ::ActionView::Base
    end
    
    module HelperExtensions
      def ok_url_tag
        hidden_field_tag "ok_url", params[:ok_url] if !params[:ok_url].blank?
      end
    end
  end
end


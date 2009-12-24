module Fume
  module Authlogic
    def self.enable
      ActionController::Base.send :include, ControllerExtensions::InstanceMethods
      ActionController::Base.send :helper_method, :current_user_session, :current_user
    end
    
    module ControllerExtensions
      module InstanceMethods
        
        protected
        def current_user_session
          return @current_user_session if defined?(@current_user_session)
          @current_user_session = UserSession.find
        end

        def current_user
          return @current_user if defined?(@current_user)
          @current_user = current_user_session && current_user_session.user
        end

        def redirect_to_ok_url_or_default(default)
          redirect_to params[:ok_url] || default
        end
      end
    end
  end
end


Fume::Authlogic.enable if defined? ::Authlogic
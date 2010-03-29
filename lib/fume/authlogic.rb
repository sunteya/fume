module Fume
  module Authlogic
    def self.try_enable
      if defined? ::Authlogic
        ActionController::Base.send :include, ControllerExtensions::InstanceMethods
        ActionController::Base.send :helper_method, :current_user_session, :current_user
      end
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
      end
    end
  end
end



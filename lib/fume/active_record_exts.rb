module Fume
  module ActiveRecordExts
    extend ActiveSupport::Concern
      
    included do
      include RequireAccessor
    end
  end
end


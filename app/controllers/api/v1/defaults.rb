module API  
  module V1
    module Defaults
      extend ActiveSupport::Concern

      included do
        prefix "api"
        version "v1", using: :path
        default_format :json
        format :json

        helpers do

          def authorize
            error!("unauthorized", 401) unless current_user
          end

          def current_user
            @current_user ||= User.find_by_token(params[:token])
          end

          def logger
            Rails.logger
          end
        end
      end
    end
  end
end  
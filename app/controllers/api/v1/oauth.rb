module API  
  module V1
    class Oauth < Grape::API
      include API::V1::Defaults

      resource :oauth do
        put "login", root: :oauth do
          Remote::ApiUser.authorize(params[:name], params[:password])
        end

        put "logout", root: :oauth do
          authorize
          Remote::ApiUser.new(@current_user).logout
        end
      end

    end
  end
end
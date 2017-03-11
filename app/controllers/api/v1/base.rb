module API  
  module V1
    class Base < Grape::API
      mount API::V1::Oauth
      mount API::V1::Speeches
    end
  end
end 
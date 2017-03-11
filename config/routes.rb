Rails.application.routes.draw do

  get 'external_apps/index'

  get 'users/dashboard'

  controller :sessions do
    get :signin, action: :new
    post :signin, action: :create
    delete :signout, action: :destroy
  end

  mount API::Base, at: "/"
  root to: "users#dashboard"

end

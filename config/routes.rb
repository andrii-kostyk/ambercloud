Rails.application.routes.draw do

  get 'notes/index'

  get 'external_apps/index'

  get 'users/dashboard'

  resources :notes, path_names: { index: '' }, only: [:index]

  controller :sessions do
    get :signin, action: :new
    post :signin, action: :create
    delete :signout, action: :destroy
  end

  mount API::Base, at: "/"
  root to: "users#dashboard"

end

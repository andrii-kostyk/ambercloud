class SessionsController < ApplicationController
  before_filter :authorize, only: [:destroy]
  layout "unauthorized"

  def new
  end

  def create
  	user = User.find_by_name(user_params[:name])
  	if user && user.authenticate(user_params[:password])
      session[:user] = {
        uuid: user.uuid
      }
      redirect_to root_path
    else
      redirect_to signin_path
    end
  end

  def destroy
  	session[:user] = nil
    redirect_to signin_path
  end

private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end

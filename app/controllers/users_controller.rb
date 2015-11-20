class UsersController < ApplicationController
  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      session[:session_token] = user.session_token
      redirect_to '/user' #fill in url
    else
      redirect_to new_user_url #fill in
    end
  end

  def show

  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end

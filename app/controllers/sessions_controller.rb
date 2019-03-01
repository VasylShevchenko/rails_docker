class SessionsController < ApplicationController
  def create
    user = login(params[:email], params[:password], params[:remember_me])

    if user
      redirect_back_or_to root_url, info: 'Logged in!'
    else
      flash.now.alert = 'Email or password was invalid'
      render :new
    end
  end

  def destroy
    logout
    flash[:info] = 'Logged out!'
    redirect_to login_url
  end
end

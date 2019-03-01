class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user_params[:email], user_params[:password])
      flash[:info] = 'Signed up!'
      redirect_to root_url
    else
      if @user.errors.any?
        for message in @user.errors.full_messages
          flash[:warning] = message
        end
      end
      redirect_to signup_url
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end

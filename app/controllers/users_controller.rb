class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      #when you signup, you will automatically login
      session[:user_id]=user.id
      redirect_to '/'
    else
      redirect_to 'signup'
    end
  end

  private

  def user_params
    # .require(:user) point to the form_for :user in views/users/new.html.erb 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end

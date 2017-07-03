class UsersController < ApplicationController
  
  def show
    if current_user.nil?
      redirect_to new_session_path
    end
  end
  
  def new
  end

  def create
    user = User.new(create_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to root_path
    end
  end
  
  private
  
  def create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :first_name, :middle_initial, :last_name)
  end

end

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!" 
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
    
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to user_path(:id)
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :about)
  end 
end
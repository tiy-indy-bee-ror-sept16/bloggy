class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root
    else
      flash[:warning] = "Please fix the below."
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      session[:user_id] = @user.id
      redirect_to :root
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email_address, :password, :password_confirmation)
  end

end

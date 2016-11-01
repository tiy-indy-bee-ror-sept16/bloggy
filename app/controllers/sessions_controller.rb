class SessionsController < ApplicationController

  before_action :forbid_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(
                  username: params[:session][:username]
                ).try(:authenticate, params[:session][:password])
    if user
      session[:user_id] = user.id
      redirect_to session[:return_to] || :root
    else
      flash.now[:warning] = "Those credentials do not match"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been loggged out."
    redirect_to :root
  end

end

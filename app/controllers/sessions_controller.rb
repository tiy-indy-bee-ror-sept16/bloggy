class SessionsController < ApplicationController

  before_action :forbid_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(
                  username: params[:session][:username]
                )
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to :root
      else
        flash[:warning] = "Your password does not match."
        render :new
      end
    else
      flash[:warning] = "No user has that name."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been loggged out."
    redirect_to :root
  end

end

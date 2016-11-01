class ForgotPasswordController < ApplicationController

  def new
    # Reset their password, email them the new one (Not great, Bob)
    # Send them a token and a link to reset their password
  end

  def create
    user = User.find_by(email_address: params[:forgot][:email_address])
    if user
      # create a token
      user.add_token
      # send email
      ForgotPasswordMailer.forgot_password(user).deliver_now
    end
  end

  def show
    @user = User.find_by(password_token: params[:id])
    if @user
      @user.update(password_token: nil)
    else
      flash[:warning] = "That token has expired."
      redirect_to :forgot_password
    end
  end

end

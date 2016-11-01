class ForgotPasswordMailer < ApplicationMailer

  def forgot_password(user)
    @user = user
    mail(to: @user.email_address, subject: "Reset your password")
  end

end

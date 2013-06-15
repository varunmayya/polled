class UserMailer < ActionMailer::Base
  default from: "beta@polled.net"
  def registration_confirmation(user)
    @user = user
    mail(:to => @user.email, :subject =>"Welcome to the Polled Beta")
  end
  
end

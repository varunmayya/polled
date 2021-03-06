class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.json

  
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:user_name => omniauth['info']['nickname'], :provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_path
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        session[:flag] = 1
        flash[:notice] = "We'll need some basic information from you to protect your identity, send you updates on your polls and more!"
        redirect_to new_user_registration_path
      end
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    if @authentication 
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    current_user.destroy
    current_user.epolls.destroy
    if session[:omniauth]
    session[:omniauth] = nil
  end
    sign_out
    redirect_to root_path
  end
  end
  def new
  end
  protected

  # This is necessary since Rails 3.0.4
  # See https://github.com/intridea/omniauth/issues/185
  # and http://www.arailsdemo.com/posts/44
  def handle_unverified_request
    true
  end
end


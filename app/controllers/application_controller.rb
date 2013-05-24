class ApplicationController < ActionController::Base
  protect_from_forgery
  
  current_user = User.new
end

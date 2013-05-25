class ApplicationController < ActionController::Base
  protect_from_forgery
  
  current_user||= User.new #i changed this
  
  def count_poll
    if current_user
      counter = 0
      @c = current_user.epolls.count 
    end
  end
  
  helper_method :count_poll
end

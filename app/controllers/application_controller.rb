class ApplicationController < ActionController::Base
  protect_from_forgery
  
  current_user||= User.new #i changed this
  
  def count_opts
    if current_user
      counter = 0
      @c = current_user.epolls 
      @c.each do |i|
         counter = counter + i.options.count
      end
      counter
    end
  end
  
  helper_method :count_opts
end

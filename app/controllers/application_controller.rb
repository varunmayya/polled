class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :store_location
  
  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/login/
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
  
  
  current_user||= User.new #i changed this
  
  
  
  
  def count_poll
    if current_user
      @c = current_user.epolls.count 
    end
  end
  
  def find_user_from_epoll(epoll)
    if User.find(epoll.user_id).authentications.exists?
    User.find(epoll.user_id).authentications.first.user_name 
  else
    "NullUser"
  end
  end
  
  def vote_has_been_cast?
    if current_user
  @current_user_votes = Vote.where("user_id" =>current_user.id)
  @current_poll_votes = []
  @epoll.options.each do |option| 
    @current_poll_votes += option.votes
  end
  @intersect_votes = @current_user_votes & @current_poll_votes
  if @intersect_votes == []
    return false
  else
    return true
  end
end
  end
  
  def whichvote
    if current_user
    @current_user_votes = Vote.where("user_id" =>current_user.id)
     @current_poll_votes = []
     @epoll.options.each do |option| 
       @current_poll_votes += option.votes
     end
     @intersect_votes = @current_user_votes & @current_poll_votes
     unless @intersect_votes == []
     return @intersect_votes[0].option_id.to_i
   end
 end
     end
     
     def show_vote_parts(a)
        return (a.votes.count/@epoll.options.flat_map(&:votes).count.to_f) *100
    end
    

    
    


    
    
  helper_method :show_vote_parts
  helper_method :count_poll
  helper_method :vote_has_been_cast?
  helper_method :whichvote
  helper_method :find_user_from_epoll
end

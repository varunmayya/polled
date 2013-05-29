class ApplicationController < ActionController::Base
  protect_from_forgery
  
  current_user||= User.new #i changed this
  
  def count_poll
    if current_user
      counter = 0
      @c = current_user.epolls.count 
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
  

  
  helper_method :count_poll
  helper_method :vote_has_been_cast?
  helper_method :whichvote
end

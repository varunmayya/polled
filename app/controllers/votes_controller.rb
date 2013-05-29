class VotesController < ApplicationController
  before_filter :authenticate_user!
  def new
    @vote = Vote.new
    #respond_to do |format|
       #format.html # new.html.erb
       #format.json { render json: @vote}
     #end
  end
  
  def create
    @vote = Vote.new(params[:vote])
    @vote.user_id = current_user.id
    @vote.location = request.location.city
    respond_to do |format|
      if @vote.save
        format.html { redirect_to request.referer, notice: 'Vote cast' }
        format.json { render json: @vote, status: :created, location: @vote }
      else
        format.html { redirect_to request.referer, notice: 'Sorry we were not able to cast your vote'}
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
    
  end
end

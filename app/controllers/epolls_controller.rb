class EpollsController < ApplicationController
  # GET /epolls
  # GET /epolls.json
  before_filter :authenticate_user!, :except => [:show, :index]
  def index
    @epolls = Epoll.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @epolls }
    end
  end
  
  def mypolls
    @epolls = current_user.epolls.order("created_at DESC")
     respond_to do |format|
        format.html # mypolls.html.erb
        format.json { render json: @epolls }
    end
  end
  
  def trending
    @epolls = current_user.epolls.order("created_at DESC")
     respond_to do |format|
        format.html # mypolls.html.erb
        format.json { render json: @epolls }
    end
  end
  
  def statistics
    if Epoll.find(params[:id]).user_id.to_i == current_user.id
    @epoll = Epoll.find(params[:id])
    @whichuser = User.find(@epoll.user_id).authentications.first.user_name if User.find(@epoll.user_id).authentications.exists?
  else
   raise ActiveRecord::RecordNotFound
  end
  
  end
  

  # GET /epolls/1
  # GET /epolls/1.json
  def show
    @epoll = Epoll.find(params[:id])
    @whichuser = User.find(@epoll.user_id).authentications.first.user_name if User.find(@epoll.user_id).authentications.exists?
    @vote = Vote.new
    @vote.option_id = whichvote 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @epoll }
    end
  end

  # GET /epolls/new
  # GET /epolls/new.json
  def new
    @epoll = Epoll.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @epoll }
    end
  end

  # GET /epolls/1/edit
  def edit
    
    unless Epoll.find(params[:id]).user_id.to_i == current_user.id
        redirect_to request.referer
      end
      
      @epoll = Epoll.find(params[:id])
    
  end

  # POST /epolls
  # POST /epolls.json
  def create
    @epoll = Epoll.new(params[:epoll])

    @epoll.user_id = current_user.id
    respond_to do |format|
      if @epoll.save
        format.html { redirect_to @epoll, notice: 'Poll was successfully created.' }
        format.json { render json: @epoll, status: :created, location: @epoll }
      else
        format.html { render action: "new" }
        format.json { render json: @epoll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /epolls/1
  # PUT /epolls/1.json
  def update
    @epoll = Epoll.find(params[:id])

    respond_to do |format|
      if @epoll.update_attributes(params[:epoll])
        format.html { redirect_to @epoll, notice: 'Poll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @epoll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /epolls/1
  # DELETE /epolls/1.json
  def destroy
    
if Epoll.find(params[:id]).user_id.to_i == current_user.id

        
    @epoll = Epoll.find(params[:id])
    @epoll.destroy

    respond_to do |format|
      format.html { redirect_to epolls_url }
      format.json { head :no_content }
    end
  else
    redirect_to request.referer
  end
end
end

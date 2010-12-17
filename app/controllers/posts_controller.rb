class PostsController < ApplicationController
  before_filter :get_post, :only => [:show, :edit, :update]
  authorize_resource
  
  def show
    
    respond_to do |format|
      format.html
      format.json do
        render :json => @post
      end
    end
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    render :new
  end
  
  def create
    @post = Post.new params[:post]
    
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
  
  def update
    if @post.update_attributes params[:post]
      redirect_to @post
    else
      render :new
    end
  end
  
  
  private
  def get_post
    @post = Post.where(:slug => params[:id]).first
  end
end

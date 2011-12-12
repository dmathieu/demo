class UsersController < ApplicationController
  before_filter :get_user

  def index
    @users = User.all
    respond_with @users
  end

  def show
    respond_with @user
  end

  def new
    @user = User.new
    respond_with @user
  end

  def edit
    respond_with @user
  end

  def create
    @user = User.create params[:user]
    respond_with @user
  end

  def update
    @user.update_attributes params[:user]
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  private
  def get_user
    id = params[:id] || params[:user_id]
    if id
      @user = User.find params[:id]
    end
  end
end

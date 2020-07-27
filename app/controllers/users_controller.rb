class UsersController < ApplicationController
  before_action :logged_in?, only:[:following, :followers]
  
  
  def index
     @user||=current_user
    if logged_in?
     @show = Micropost.where(user_id: current_user.id)
     @relationship = Relationship.where(follower_id: current_user.id) 
     @user_feed = Micropost.new
    end
  end
  
  def show
   @user = User.find_by(params[:id])
   @users = @user.followers.page(params[:page])
   @show = Micropost.where(user_id: params[:id])
  end
  
 
  
  def new
    @user =User.new
  end
  
  def create
    @user = User.create(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to staticpages_home_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to index
    else
      render 'edit'
    end
  end

  def destroy

  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page])
    render 'following'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    render 'followers'
  end
  


  private
  
  def user_params
     params.require(:user).permit(:id, :name, :email ,:password ,:password_confirmation, :user_id)
  end

  def micropost_params
     params.permit(:id, :content, :user_id)
  end
end

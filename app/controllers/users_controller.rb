class UsersController < ApplicationController
 
  def show
   @user = User.find_by(id: params[:id])
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
  end

  def update
  end

  def destroy
  end
  
  def following
   @title = "Following"
   @user  = User.find(params[:id])
   @users = @user.following.paginate(page: params[:page])
   render 'use'
  end
  def followers
   @title = "Followers"
   @user  = User.find(params[:id])
   @users = @user.followers.paginate(page: params[:page])
   render '#'
  end


  private
  
  def user_params
     params.require(:user).permit(:name, :email ,:password ,:password_confirmation)
  end



end

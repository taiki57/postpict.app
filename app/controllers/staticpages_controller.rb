class StaticpagesController < ApplicationController
  def home
    if logged_in?
    
      @micropost  = Micropost.all
      @feed_items = Micropost.all.page(params[:page])
    end
  end
  def login
  end
  def show 
  end
end

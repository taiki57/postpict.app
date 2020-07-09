class StaticpagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed
    end
  end
  def login
  end
  def show
    
  end
end

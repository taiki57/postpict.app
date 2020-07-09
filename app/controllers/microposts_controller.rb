class MicropostsController < ApplicationController
    #before_action :logged_in? ,only:[:show, :create, :destroy]
  
    
    def new
        @micropost = Micropost.new
    end
    
    def create
        @micropost = Micropost.create(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to users_show_path
            @feed_items = []
        else
            render 'microposts/new'
        end
    end

    def destroy
    end
    
    def save 
    end
    
    private
    def micropost_params
        params.require(:micropost).permit(:id, :content, :user_id)
    end
end

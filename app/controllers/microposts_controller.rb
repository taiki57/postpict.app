class MicropostsController < ApplicationController
    #before_action :logged_in? ,only:[:show, :create, :destroy]
 
 
    
  
    
    def new
        @micropost = Micropost.find_by(id: params[:id])
    end
    
    def create
        @micropost = Micropost.new(content: params[:content])
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to users_show_path
        else
            render 'microposts/new'
        end
    end

    def destroy
    end
    
    def save 
    end
end

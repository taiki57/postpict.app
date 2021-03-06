class MicropostsController < ApplicationController
    before_action :logged_in? ,only:[:new, :create, :destroy]
    protect_from_forgery with: :null_session
    
    def new
        @micropost = Micropost.new
    end
    
    def create
        @micropost = Micropost.create(micropost_params)
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to staticpages_home_path
            @feed_items = []
        else
            render 'microposts/new'
        end
    end
    
    
    
    def destroy
        @show = Micropost.where(user_id: params[:id])
        @micoposts = Micropost.find_by("#{@show.id}")
        @micoposts.destroy
    end
    
    def save 
    end
    
    private
    def micropost_params
        params.require(:micropost).permit(:id, :content, :user_id, :created_at, :updated_at)
    end
    
end

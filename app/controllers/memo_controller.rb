class MemoController < ApplicationController
    
    def new
        
        @memo = Memo.new
    end
    
    def create
        @memo = Memo.create(memo_params)
        if @memo.save
            flash[:success] = "Micropost saved!"
            redirect_to memo_show_path
            @feed_items = []
        else
            render 'memo/new'
        end
    end
    
    def show
        @shows = Memo.where(params[:content])
    end
    
    def micropost
        
    end
    
    private
    def memo_params
        params.require(:memo).permit(:id, :content, :user_id, :created_at, :updated_at)
    end
end

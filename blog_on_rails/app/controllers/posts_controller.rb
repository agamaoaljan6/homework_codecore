class PostsController < ApplicationController
    before_action :find_post , only: [:show, :edit, :update, :destroy]
    
    def index 
    @posts = Post.all
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new params.require(:post).permit(:title, :body)
    end
    
    def show 
    
    end
    
    def edit
        
    end
    
    def update
        
    end

    def destroy
    @post.destroy 
    redirect_to post_path
    end


    private 
    def find_posts
        @post = Post.find(params[:id])
    end
end

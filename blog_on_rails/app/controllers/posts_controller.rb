class PostsController < ApplicationController
    before_action :find_posts , only: [:show, :edit, :update, :destroy]
    
    def index 
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save 
        flash[:success] = "Post was successfully created!"
        redirect_to post_path(@post)
        else
        @post.errors
        redirect_to 'new'
        end
    end
    
    def show 
    end
    
    def edit
    end
    
    def update
    end

    def destroy
    @post.destroy 
    flash[:danger] = "Post was successfully deleted!"
    redirect_to post_path
    end


    private 

    def post_params
        params.require(:post).permit(:title, :body)
    end

    def find_posts
        @post = Post.find(params[:id])
    end
end

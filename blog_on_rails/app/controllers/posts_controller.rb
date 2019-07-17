class PostsController < ApplicationController
    before_action :find_posts , only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show] 
    before_action :authorize!, only: [:edit, :update, :destroy]
    def index 
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save 
            flash[:success] = "Post was successfully created!"
            redirect_to post_path(@post)
        else
            @post.errors
            render 'new'
        end
    end
    
    def show 
        @comment = Comment.new
        @comments = @post.comments.order(created_at: :desc)
    end
    
    def edit
    end
    
    def update
        if @post.update(post_params)
            flash[:success] = "Post was successfully updated!"
            redirect_to post_path(@post)
        else
            @post.errors
            render 'edit'
        end
    end

    def destroy
    @post.destroy 
    flash[:danger] = "Post was successfully deleted!"
    redirect_to posts_path
    end


    private 
    def post_params
        params.require(:post).permit(:title, :body)
    end

    def find_posts
        @post = Post.find(params[:id])
    end

    def authorize! 
        flash[:danger] = "Not Authorized!"
        redirect_to root_path unless 
        can?(:crud, @post)
      end 
end

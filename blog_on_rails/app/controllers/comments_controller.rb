class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new comment_params
        @comment.post = @post
        @comment.user = current_user
        if @comment.save
        
            redirect_to post_path(@post)
        else
            @comments = @post.comments.order(created_at: :desc)
            render 'posts/show'
        end
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to post_path(@comment.post)
        if can? :crud, @comment
            @comment.destroy
            flash[:danger] = "Comment was deleted"
            redirect_to post_path(@comment.post)
        else
            flash[:danger] = "Not authorized"
            redirect_to post_path(@comment.post)
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:body)

    end
    
end

class CommentsController < ApplicationController

    def new
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new
    end

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      if @comment.save
        redirect_to @post, notice: 'Comment added successfully.'
      else
        render 'posts/show'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:name, :email, :body)
    end
  end
  
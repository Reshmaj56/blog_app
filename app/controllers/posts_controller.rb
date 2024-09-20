class PostsController < ApplicationController
    before_action :get_post, only: [:show, :edit, :update, :destroy]
    def index
      @posts = Post.order(created_at: :desc)
    end
  
    def show
      @comment = Comment.new
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to @post, notice: 'Post created successfully.'
      else
        redirect_to new_post_path, notice: @post.errors.full_messages
      end
    end
  
    def edit
    end
  
    def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to posts_path, notice: 'Post deleted successfully.'
    end
  
    private

    def get_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
  
class PostsController < ApplicationController
  def index
    @posts = Post.published.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show
    @post = Post.friendly.find(params[:id])
  end
end
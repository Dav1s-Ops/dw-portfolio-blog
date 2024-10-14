class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.published.order(created_at: :desc).page(params[:page]).per(6)
  end

  def pending
    @posts = Post.draft.order(created_at: :desc).page(params[:page]).per(6)
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to admin_posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # ... edit, update, destroy actions

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :status, category_ids: [], tag_ids: [])
  end
end

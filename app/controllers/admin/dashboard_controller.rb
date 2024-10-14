class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  def home
    @total_posts = Post.count
    @total_categories = Category.count
    @total_tags = Tag.count
    @draft_posts = Post.draft.count
    @posts_by_category = Category.joins(:posts).group('categories.name').count
  end
end

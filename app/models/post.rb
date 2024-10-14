class Post < ApplicationRecord
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :taggings
  has_many :tags, through: :taggings

  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :content, presence: true
end

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.order(id: :DESC).limit(3)
  end
end

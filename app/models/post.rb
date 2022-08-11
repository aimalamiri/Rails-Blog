class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  def last_five_comments
    comments.order(id: :DESC).limit(5)
  end
end

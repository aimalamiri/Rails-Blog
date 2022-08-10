class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments
  has_many :likes

  def last_five_comments
    comments.order(id: :DESC).limit(5)
  end
end

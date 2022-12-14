class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true

  def last_three_posts
    posts.order(id: :DESC).limit(3)
  end

  def admin?
    role == 'admin'
  end
end

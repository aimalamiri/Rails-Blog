class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :delete, Comment, user: user
    can :delete, Post, user: user

    return unless user.admin?

    can :delete, Post
    can :delete, Comment
  end
end

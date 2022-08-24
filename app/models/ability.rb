# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :delete, Post, user: user

    return unless user.admin?
    can :delete, Post
  end
end

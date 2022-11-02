class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    can :manage, Like, author_id: user.id
    can :manage, User, id: user.id
  end
end

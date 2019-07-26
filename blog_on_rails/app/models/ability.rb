class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    end
    alias_action :create, :read, :update, :destroy, to: :crud

    can(:crud, Post) do |post|
      post.user == user
    end

    can :crud, Comment do |comment|
      comment.user == user || comment.post.user == user
    end
    
    can :crud, User do |a_user|
      user == a_user
    end

  end
end
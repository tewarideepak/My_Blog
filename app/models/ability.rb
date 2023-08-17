# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    
    if user.subscribed?
      if user.admin?
        can :manage, :all
      elsif user.editor?
        can :read, :all
        can :create, Article
        can :update, Article
        can :destroy, Article, author_id: user.id
        can :manage, Comment
      elsif user.normal_user?
        can :read, :all
        can :create, Article
        can :update, Article, author_id: user.id
        can :destroy, Article, author_id: user.id
        can :create, Comment
        can :destroy, Comment, author_id: user.id
      end
    else
      can :read, :all
    end

  end
end

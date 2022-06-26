# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can :read, Subject
      can :manage, Subscription, user_id: user.id
      can :manage, Achievement, subscription_id: user.subscription_ids
      can :new, Achievement
    end
  end
end

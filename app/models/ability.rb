# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  def initialize(user)
    can :read, Role
    can :read, MovieTheater

    return if user.blank?

    can :manage, User, id: user.id
    case user.role.name
    when 'ADMIN'
      can :manage, Role
      can :manage, MovieTheater
    end
  end
end

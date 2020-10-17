# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  def initialize(user)
    can :read, Category
    can :read, MovieTheater
    can :read, Role
    can :read, Room
    can :read, Section

    return if user.blank?

    can :manage, User, id: user.id

    case user.role.name
    when 'ADMIN'
      can :manage, Category
      can :manage, MovieTheater
      can :manage, Role
      can :manage, Room
      can :manage, Section
    end
  end
end

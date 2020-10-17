# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  def initialize(user, params)
    puts "BATMAN"
    puts params
    can :read, Category
    can :read, MovieTheater
    can :read, Section
    can :read, Movie

    return if user.blank?

    can :manage, User, id: user.id

    case user.role.name
    when 'ADMIN'
      can :manage, Category
      can :manage, Movie
      can :manage, MovieTheater
      can :manage, MovieTheaterMovie
      can :manage, Role
      can :manage, Room
      can :manage, Section
    end
  end
end

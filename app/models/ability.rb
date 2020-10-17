# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # See the wiki for details:
  # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  def initialize(user, params)
    can :read, Category
    can :read, MovieTheater
    can :read, Section
    can :read, Movie

    can :read, MovieCategory do
      category_id == params[:category_id] || movie_id == params[:movie_id]
    end

    can :read, MovieTheaterMovie, movie_theater_id: params[:movie_theater_id]

    return if user.blank?

    can :manage, User, id: user.id

    case user.role.name
    when 'ADMIN'
      can :manage, Category
      can :manage, Movie
      can :manage, MovieCategory, movie_id: params[:movie_id]
      can :manage, MovieTheater
      can :manage, MovieTheaterMovie, movie_theater_id: params[:movie_theater_id]
      can :manage, Role
      can :manage, Room, movie_theater_id: params[:movie_theater_id]
      can :manage, Section, movie_theater_id: params[:movie_theater_id]
    end
  end
end

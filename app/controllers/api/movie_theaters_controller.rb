module Api
  class MovieTheatersController < ApplicationController

    def index
      paginate json: @movie_theaters.order(name: :asc)
    end

    def show
      render json: @movie_theater
    end

    def create
      @movie_theater = MovieTheater.new(movie_theater_params)

      if @movie_theater.save
        render json: @movie_theater, status: :created, location: @movie_theater
      else
        render json: @movie_theater.errors, status: :unprocessable_entity
      end
    end

    def update
      if @movie_theater.update(movie_theater_params)
        render json: @movie_theater
      else
        render json: @movie_theater.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @movie_theater.destroy
    end

    private

    def movie_theater_params
      params.permit(:name, :deleted_at, :picture, :banner)
    end
  end
end

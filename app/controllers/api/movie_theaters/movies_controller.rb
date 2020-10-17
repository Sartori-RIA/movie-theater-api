class MoviesController < ApplicationController

  def index
    paginate json: @movie_theater_movies, include: %i[movie]
  end

  def show
    render json: @movie_theater_movie, include: %i[movie]
  end

  def create
    @movie_theater_movie = MovieTheaterMovie.new(movie_theater_movie_params)

    if @movie_theater_movie.save
      render json: @movie_theater_movie, status: :created
    else
      render json: @movie_theater_movie.errors, status: :unprocessable_entity
    end
  end

  def update
    if @movie_theater_movie.update(movie_theater_movie_params)
      render json: @movie_theater_movie
    else
      render json: @movie_theater_movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie_theater_movie.destroy
  end

  private

  def movie_theater_movie_params
    params.permit(:movie_theater_id, :movie_id)
  end
end

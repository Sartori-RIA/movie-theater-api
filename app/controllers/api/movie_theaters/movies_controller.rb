class MoviesController < ApplicationController
  load_and_authorize_resource class: MovieTheaterMovie

  def index
    paginate json: @movies, include: %i[movie]
  end

  def show
    render json: @movie, include: %i[movie]
  end

  def create
    @movie = MovieTheaterMovie.new(movie_theater_movie_params)

    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_theater_movie_params)
      render json: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
  end

  private

  def movie_theater_movie_params
    params.permit(:movie_theater_id, :movie_id)
  end
end

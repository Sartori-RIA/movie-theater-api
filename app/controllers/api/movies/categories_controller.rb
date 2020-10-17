module Api
  module Movies
    class CategoriesController < ApplicationController
      load_and_authorize_resource class: MovieCategory

      def create
        @movie_category = MovieCategory.new(movie_category_params)

        if @movie_category.save
          render json: @movie_category, status: :created
        else
          render json: @movie_category.errors, status: :unprocessable_entity
        end
      end

      def update
        if @movie_category.update(movie_category_params)
          render json: @movie_category
        else
          render json: @movie_category.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @movie_category.destroy
      end

      private

      def movie_category_params
        params.permit(:category_id, :movie_id)
      end
    end
  end
end

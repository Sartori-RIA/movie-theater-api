module Api
  module Categories
    class MoviesController < ApplicationController
      load_and_authorize_resource class: MovieCategory

      def index
        paginate json: @movie_categories, include: [:movie]
      end
    end
  end
end

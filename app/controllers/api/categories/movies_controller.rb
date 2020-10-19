module Api
  module Categories
    class MoviesController < ApplicationController
      load_and_authorize_resource class: MovieCategory

      def index
        paginate json: @movies, include: %i[movie]
      end
    end
  end
end

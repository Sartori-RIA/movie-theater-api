module Api
  module Categories
    class MoviesController < ApplicationController
      load_and_authorize_resource class: MovieCategory

      def index
        render json: {}
      end
    end
  end
end

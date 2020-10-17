module Api
  module MovieTheaters
    class SectionsController < ApplicationController
      load_and_authorize_resource

      def index
        render json: @sections
      end

      def show
        render json: @section
      end

      def create
        @section = Section.new(movie_theater_section_params)

        if @section.save
          render json: @section, status: :created
        else
          render json: @section.errors, status: :unprocessable_entity
        end
      end

      def update
        if @section.update(movie_theater_section_params)
          render json: @section
        else
          render json: @section.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @section.destroy
      end

      private

      def movie_theater_section_params
        params.permit(:start_date, :end_date, :room, :movie)
      end
    end
  end
end


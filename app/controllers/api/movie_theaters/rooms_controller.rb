module Api
  module MovieTheaters
    class RoomsController < ApplicationController

      def index
        render json: @rooms
      end

      def show
        render json: @room
      end

      def create
        @room = Room.new(room_params)

        if @room.save
          render json: @room, status: :created
        else
          render json: @room.errors, status: :unprocessable_entity
        end
      end

      def update
        if @room.update(room_params)
          render json: @room
        else
          render json: @room.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @room.destroy
      end

      private

      def room_params
        params.permit(:name, :deleted_at, :movie_theater)
      end
    end
  end
end


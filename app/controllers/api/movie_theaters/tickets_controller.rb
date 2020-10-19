module Api
  module MovieTheaters
    class TicketsController < ApplicationController
      load_and_authorize_resource

      def index
        paginate json: @tickets, include: %i[session]
      end

      def show
        render json: @ticket
      end

      def create
        @ticket = Ticket.new(ticket_params)

        if @ticket.save
          render json: @ticket, status: :created
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
      end

      def update
        if @ticket.update(ticket_params)
          render json: @ticket
        else
          render json: @ticket.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @ticket.destroy
      end

      private

      def ticket_params
        params.permit(:session_id, :seat, :half)
      end
    end
  end
end

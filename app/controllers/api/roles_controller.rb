# frozen_string_literal: true

module Api
  class RolesController < ApplicationController
    def index
      render json: @roles
    end

    def show
      render json: @role
    end

    def create
      @role = Role.new(role_params)
      if @role.save
        render json: @role, status: :created
      else
        render json: @role.errors, status: :unprocessable_entity
      end
    end

    def update
      if @role.update(role_params)
        render json: @role
      else
        render json: @role.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @role.destroy
    end

    private

    def role_params
      params.permit(:name)
    end
  end
end

module Api
  class CategoriesController < ApplicationController

    def index
      render json: @categories
    end

    def show
      render json: @category
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        render json: @category, status: :created
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def update
      if @category.update(category_params)
        render json: @category
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @category.destroy
    end

    private

    def category_params
      params.permit(:name)
    end
  end
end

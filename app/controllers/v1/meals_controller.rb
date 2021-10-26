module V1
  class MealsController < ApplicationController
    before_action :set_meal, only: %i[show update destroy]
    # GET /meals
    def index
      @meals = Meal.latest_meals(current_user.id)
      json_response(@meals)
    end

    # POST /meals
    def create
      current_user.meals.create!(meal_params)
      json_response(@meal, :created)
    end

    # GET /meals/:id
    def show
      json_response(@meal)
    end

    # PUT /meals/:id
    def update
      @meal.update(meal_params)
      head :no_content
    end

    # DELETE /meals/:id
    def destroy
      @meal.destroy
      head :no_content
    end

    private

    def meal_params
      # whitelist params
      params.permit(:title)
    end

    def set_meal
      @meal = Meal.find(params[:id])
    end
  end
end
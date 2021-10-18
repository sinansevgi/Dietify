class FoodsController < ApplicationController
  before_action :set_meal
  before_action :set_meal_food, only: %i[show update destroy]

  # GET /meals/:meal_id/foods
  def index
    json_response(@meal.foods)
  end

  # GET /meals/:meal_id/foods/:id
  def show
    json_response(@food)
  end

  # POST /meals/:meal_id/foods
  def create
    @meal.foods.create!(food_params)
    json_response(@meal, :created)
  end

  # PUT /meals/:meal_id/foods/:id
  def update
    @food.update(food_params)
    head :no_content
  end

  # DELETE /meals/:meal_id/foods/:id
  def destroy
    @food.destroy
    head :no_content
  end

  private

  def food_params
    params.permit(:name, :calories)
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end

  def set_meal_food
    @food = @meal.foods.find_by!(id: params[:id]) if @meal
  end
end

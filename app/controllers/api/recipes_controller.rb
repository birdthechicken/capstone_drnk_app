class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render 'index.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                        name: params[:name],
                        ingredients: params[:ingredients],
                        price: params[:price]
                        )

    if @recipe.save
      render 'show.json.jbuilder'
    else
      render json: {message: @recipe.errors.full_messages}
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.name = params[:name] || @recipe.name
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.price = params[:price] || @recipe.price

    if @recipe.save
      render 'show.json.jbuilder'
    else
      render json: {message: @recipe.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    render json: {message: "Deleted"}
  end
end

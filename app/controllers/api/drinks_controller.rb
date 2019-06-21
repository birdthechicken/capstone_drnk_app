class Api::DrinksController < ApplicationController

  def index
    @drinks = Drink.all
    render 'index.json.jbuilder' 
  end 

  def create
    @drink = Drink.new(
                       order_id: params[:order_id],
                       recipe_id: params[:recipe_id],
                       rating: params[:rating],
                       comment: params[:comment],
                       status:  0
      )

    if @drink.save
      render 'show.json.jbuilder'
    else
      render json: {message: @drink.errors.full_messages }
    end 
  end

  def show
    @drink = Drink.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @drink = Drink.find(params[:id])

    @drink.order_id = params[:order_id] || @drink.order_id
    @drink.recipe_id = params[:recipe_id] || drink.recipe_id
    @drink.rating = params[:rating] || drink.rating
    @drink.comment = params[:comment] || drink.comment
    @drink.status = params[:status] || drink.status

    if @drink.save
      render 'show.json.jbuilder'
    else
      render json: {message: @drink.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    render json: {message: "Deleted"}
  end
end

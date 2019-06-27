class Api::DrinksController < ApplicationController
  before_action :authenticate_user

  def index
    @drinks = current_user.submitted_drinks
    render 'index.json.jbuilder' 
  end 

  def create
    # check if there is an open order for the current user
      # if an order is open for the current user, add drink to it
      # if an order does not exist (or is not open), create one

    # @order = current_user.submitted_orders.ordering.last

    # if !@order
    #   @order = Order.new(
    #                     bartender_id: Bartender.first.id, #replace later
    #                     customer_id: current_user.id,
    #                     status: "ordering"
    #                     )
    # end

    @order = Order.find_or_create_by(
                                      bartender_id: User.find_by(bartender: true).id, #replace later
                                      customer_id: current_user.id,
                                      status: "ordering"
                                      )

    @drink = Drink.new(
                       order_id: @order.id,
                       recipe_id: params[:recipe_id],
                       status: "pending"
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
    @drink.recipe_id = params[:recipe_id] || @drink.recipe_id
    @drink.rating = params[:rating] || @drink.rating
    @drink.comment = params[:comment] || @drink.comment
    @drink.status = params[:status] || @drink.status

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

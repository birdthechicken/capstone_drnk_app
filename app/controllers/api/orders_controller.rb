class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index 
    if current_user.bartender?
      @orders = Order.where("status = 1 OR status = 2 OR status = 4 OR status = 5")
    else
      @orders = current_user.submitted_orders.order(id: :desc)
    end
    render 'index.json.jbuilder'
  end

  def create
    @order = Order.new(
                      customer_id: params[:customer_id],
                      bartender_id: params[:bartender_id]
                      )

    if @order.save
      render 'show.json.jbuilder'
    else
      render json: {message: @order.errors.full_messages}
    end
  end

  def show
    @order = Order.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @order = Order.find(params[:id])

    @order.customer_id = params[:customer_id] || @order.customer_id
    @order.bartender_id = params[:bartender_id] || @order.bartender_id
    @order.status = params[:status] || @order.status

    if @order.save
      if @order.status == "in_process"
        ActionCable.server.broadcast "alerts_channel", {
          message: "Order submitted",
          display: 'false'
        }
      elsif @order.status == "ready"
        ActionCable.server.broadcast "alerts_channel", {
          message: "Your DR!NK is ready for pick-up",
          display: 'customer'
        }
      elsif @order.status == "completed"
        ActionCable.server.broadcast "alerts_channel", {
          message: "DR!NK got picked-up",
          display: 'bartender'
        }
        render 'show.json.jbuilder'
      end
    else
      render json: {message: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    render json: {message: "Deleted"}
  end

  def current_order
    @order = current_user.submitted_orders.find_by(status: "ordering")

    if @order 
      render 'show.json.jbuilder'
    else
      render json: {drinks: []}
    end
  end
end

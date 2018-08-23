class OrdersController < ApplicationController
  def index
    @orders = Order.users_orders(current_user)
  end

  def show
    set_order
    @user = current_user
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params(:foodster_id, :cookster_id, :datetime_order_placed))
    if @order.save
      @order.create_order_recipe(params[:recipe])
      redirect_to order_path(@order)
    else
      render orders_path
      # :see_cookster(@order.order_cookster)
    end
  end


  def edit
    set_order
  end

  def update
    set_order
    if @order.update(order_params(:status, :datetime_status_order))
      redirect_to order_path(@order)
    else
      render :edit
    end
  end

  def destroy
    set_order
    @order.destroy
    redirect_to orders_path
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params(*args)
      params.require(:order).permit(*args)
  end

  def order_recipe_params(*args)
      params.require(:recipe).permit(*args)
  end
end

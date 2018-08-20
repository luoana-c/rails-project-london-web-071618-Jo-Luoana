class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    set_order
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  def edit
    set_order
  end

  def update
    set_order
    if @order.update(order_params)
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

  def order_params
  end
end

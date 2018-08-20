class FoodstersController < ApplicationController
  def index
    @foodsters = Foodster.all
  end

  def show
    set_foodster
  end

  def new
    @foodster = Foodster.new
  end

  def create
    @foodster = Foodster.new(foodster_params)
    if @foodster.save
      redirect_to foodster_path(@foodster)
    else
      render :new
    end
  end

  def edit
    set_foodster
  end

  def update
    set_foodster
    if @foodster.update(foodster_params)
      redirect_to foodster_path(@foodster)
    else
      render :edit
    end
  end

  def destroy
    set_foodster
    @foodster.destroy
    redirect_to foodsters_path
  end

  def set_foodster
    @foodster = Foodster.find(params[:id])
  end

  def foodster_params
  end
end

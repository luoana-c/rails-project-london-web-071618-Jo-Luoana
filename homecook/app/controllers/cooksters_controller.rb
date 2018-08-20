class CookstersController < ApplicationController
  def index
    @cooksters = Cookster.all
  end

  def show
    set_cookster
  end

  def new
    @cookster = Cookster.new
  end

  def create
    @cookster = Cookster.new(cookster_params)
    if @cookster.save
      redirect_to cookster_path(@cookster)
    else
      render :new
    end
  end

  def edit
    set_cookster
  end

  def update
    set_cookster
    if @cookster.update(cookster_params)
      redirect_to cookster_path(@cookster)
    else
      render :edit
    end
  end

  def destroy
    set_cookster
    @cookster.destroy
    redirect_to cooksters_path
  end

  def set_cookster
    @cookster = Cookster.find(params[:id])
  end

  def cookster_params
  end
end

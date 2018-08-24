class UsersController < ApplicationController
  def index
    @users = User.all.select{|user| user.cookster == true}
  end

  def show
    set_user
    authorized_for(params[:id])
  end

  def see_cookster
    @cookster = User.find(params[:id])
    if params[:render] == 'true'
      @order = Order.new
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
    set_user
    authorized_for(params[:id])
  end

  def update
    set_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    set_user
    @user.destroy
    redirect_to users_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :cookster, :address)
  end
end

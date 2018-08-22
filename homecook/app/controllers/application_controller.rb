class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      User.new
    end
  end

  def logged_in?
    !!current_user.id
  end

  def authorized?
    if !logged_in?
      flash[:authorized] = "You aren't logged in!"
      redirect_to login_path
    end
  end

  def authorized_for(user_id)
    authorized?
    if current_user.id != user_id.to_i
      flash[:authorized] = "You can't view a page that does not belong to you."
      if params[:controller] == "users"
        redirect_to current_user
      elsif params[:controller] == "recipes" && params[:action] == "edit"
        redirect_to recipe_path(Recipe.find(params[:id]))
      end
    end
  end

  def cookster?
    current_user.cookster
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :no_access

  private

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def no_access
    redirect_to root_url , :notice => 'You are not authorized to see this page!'
  end


end

##
# the main controller of the application
#
# everything that is written here ,will run in whole application
class ApplicationController < ActionController::Base
  protect_from_forgery
  ##
  # checking if a mobile device is requesting the site
  # if so, the code runs :prepare_for_mobile method
  before_filter :prepare_for_mobile


  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == '1'
    else
      request.user_agent =~ /Mobile|webOS/
    end
   end
  helper_method :mobile_device?

  def prepare_for_mobile
    ##
    # changes the format of the site to mobile format
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?

  end

  def current_user
    ##
    # the user that has signed in to the site
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def current_cart
    ##
    # the cart that is created using a session and the user can add products to it
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end

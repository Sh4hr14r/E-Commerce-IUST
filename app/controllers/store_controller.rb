##
# *this class controls the index page actions
# *created manually
class StoreController < ApplicationController
  def index
    ##
    # the products and the cart which are shown in the index page are defined here
    @products=Product.all
    @cart = current_cart
  end

end


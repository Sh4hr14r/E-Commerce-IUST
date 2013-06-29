class StoreController < ApplicationController
  skip_before_filter :no_access
  def index
    @products=Product.all
    @cart = current_cart
  end

end


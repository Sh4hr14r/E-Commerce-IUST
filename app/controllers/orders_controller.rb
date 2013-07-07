##
# *this class controls the orders' actions
# *created using scaffold
# *the class methods are all common controller methods
# [index] the index page for model is defined
# [show]  the page for each specific model instance eg. cart[6] is defined
# [new]   the page for creating new model instances is defined
# [create] the stuff done after the new instance created
# [edit] the edit page for model instances is defined
# [update] the method called after edit
# [destroy] mothod for destruction of model instances
class OrdersController < ApplicationController
  ##--:method: before_filter-------------------------------------------
  # using the following before_filter users cannot directly access:
  # * www.site.com/orders
  # * www.site.com/orders/[i]
  before_filter :access_denied , :only => [:index ,:show]
  def access_denied
    redirect_to root_url , :notice => 'You are not authorized to see this page!'
  end
  #-----------------------------------------------------------------

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.paginate :page=>params[:page], :order=>'created_at desc',
      :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @cart = current_cart
    if @cart.line_items.empty?
      redirect_to root_url, :notice => "Your cart is empty"
    elsif current_user.nil?
      redirect_to root_url, :notice => "You must first sign in to place order"
      return
    else
      @order = Order.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @order }
      end
    end



  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(current_cart)
    @my_order = @order.id
    respond_to do |format|
      if @order.save
        if @order.pay_type == 'Credit card'
          Cart.destroy(session[:cart_id])
          session[:cart_id] = nil
          format.html { redirect_to(payment_url, :notice =>
              'Thank you for your order.Please confirm to connect to bank payment') }
          format.xml { render :xml => @order, :status => :created,
                              :location => @order }
          elsif @order.pay_type== "Direct pay after delivery"
            Cart.destroy(session[:cart_id])
            session[:cart_id] = nil
            format.html { redirect_to(root_url, :notice =>
                'Thank you for your order.' ) }
            format.xml { render :xml => @order, :status => :created,
                                :location => @order }
          end
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def reset_cart
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
  end

  def payment
    @my_order ||= Order.find_by_email(current_user[:email]) if current_user[:email]
    @total_order_price = 0
    @my_order.line_items.each do |item|
      @total_order_price+=item.total_price
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end

##
# *this class controls the line_items' actions
# *created using scaffold
# *the class methods are all common controller methods
# [index] the index page for model is defined
# [show]  the page for each specific model instance eg. cart[6] is defined
# [new]   the page for creating new model instances is defined
# [create] the stuff done after the new instance created
# [edit] the edit page for model instances is defined
# [update] the method called after edit
# [destroy] mothod for destruction of model instances
class LineItemsController < ApplicationController
  ##--:method: before_filter-------------------------------------------
  # using the following before_filter users cannot directly access:
  # * www.site.com/line_items
  # * www.site.com/line_items/new
  # * www.site.com/line_items/[i]
  before_filter :access_denied , :except => [:create,:destroy,:update]
  def access_denied
    redirect_to root_url , :notice => 'You are not authorized to see this page!'
  end
  #-----------------------------------------------------------------
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_url }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
end

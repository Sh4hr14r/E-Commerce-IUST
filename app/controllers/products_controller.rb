##
# *this class controls the Products' actions
# *created using scaffold
# *the class methods are all common controller methods
# [index] the index page for model is defined
# [show]  the page for each specific model instance eg. cart[6] is defined
# [new]   the page for creating new model instances is defined
# [create] the stuff done after the new instance created
# [edit] the edit page for model instances is defined
# [update] the method called after edit
# [destroy] mothod for destruction of model instances
class ProductsController < ApplicationController
  ##--:method: before_filter-------------------------------------------
  # using the following before_filter users cannot directly access:
  # * www.site.com/products
  # * www.site.com/products/new
  # * www.site.com/products/[i]
  before_filter :access_denied , :except => [:create,:destroy,:update , :show]
  def access_denied
    redirect_to root_url , :notice => 'You are not authorized to see this page!'
  end
  #-----------------------------------------------------------------
  # GET /products
  # GET /products.json
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
      format.xml { render :xml => @product }
    end
  end      
end

# encoding: utf-8

class ProductsController < ApplicationController
  before_action :authenticate_user!, :except => [:index,:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def initialize
    super
    @style='products/index'
    @script='products/index'
    @controller_name=t('activerecord.models.product')
    
    get_menu('products')    
  end
  
  # GET /products
  # GET /products.json
  def index
    if(params[:product_category_id])
      @categoryId=params[:product_category_id].to_i
    else
      @categoryId=ProductCategory.find(:first).id
    end
    
    @product_categories=ProductCategory.all    
    @product_category=ProductCategory.find(@categoryId)
    
    @products = Product.where(:product_category_id=>@categoryId).order('id desc').page(params[:page]).per(4)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    @product_category=ProductCategory.find(@product.product_category_id)
    
    if(params[:product_category_id])
      categoryId=params[:product_category_id].to_i
    else
      categoryId=ProductCategory.find(:first).id
    end
    
    @products = Product.where(:product_category_id=>categoryId).order('id desc').page(params[:page]).per(10)
    @product_categories=ProductCategory.all
    @categoryId=categoryId        
    @product_category=ProductCategory.find(categoryId)
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new
    @product.build_product_content    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @product.build_product_content    
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id=current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: '상품이 등록되었습니다.' }
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
      if @product.update_attributes(product_params)
        format.html { redirect_to @product, notice: '상품이 수정되었습니다.' }
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
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:id,:user_id,:product_category_id,:title,:photo,:photo_cache,:content,:description,product_content_attributes: [:id,:content])
  end  
end

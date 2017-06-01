# encoding: utf-8

class ProductCommentsController < ApplicationController
  # GET /product_comments
  # GET /product_comments.json
  def index
    @product_comments = ProductComment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_comments }
    end
  end

  # GET /product_comments/1
  # GET /product_comments/1.json
  def show
    @product_comment = ProductComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_comment }
    end
  end

  # GET /product_comments/new
  # GET /product_comments/new.json
  def new
    @product_comment = ProductComment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_comment }
    end
  end

  # GET /product_comments/1/edit
  def edit
    @product_comment = ProductComment.find(params[:id])
  end

  # POST /product_comments
  # POST /product_comments.json
  def create
    @product_comment = ProductComment.new(params[:product_comment])

    respond_to do |format|
      if @product_comment.save
        format.html { redirect_to @product_comment, notice: 'Product comment was successfully created.' }
        format.json { render json: @product_comment, status: :created, location: @product_comment }
      else
        format.html { render action: "new" }
        format.json { render json: @product_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_comments/1
  # PUT /product_comments/1.json
  def update
    @product_comment = ProductComment.find(params[:id])

    respond_to do |format|
      if @product_comment.update_attributes(params[:product_comment])
        format.html { redirect_to @product_comment, notice: 'Product comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_comments/1
  # DELETE /product_comments/1.json
  def destroy
    @product_comment = ProductComment.find(params[:id])
    @product_comment.destroy

    respond_to do |format|
      format.html { redirect_to product_comments_url }
      format.json { head :no_content }
    end
  end
end

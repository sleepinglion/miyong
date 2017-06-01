# encoding: utf-8

class Intro::HistoriesController < ApplicationController
  before_action :authenticate_user!, :except => [:index,:show]  
  before_action :set_history, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:show]
  
  def initialize(*params)
    super(*params)
    @controller_category_name=t(:category_intro)    
    @yrs =[2011,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000]    
    @controller_name='연혁'
    
    get_menu('histories')    
  end  
  
  # GET /histories
  # GET /histories.json
  def index
    @histories=History.order('year desc').page(params[:page]).per(10) 
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @histories }
    end
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @history }
    end
  end

  # GET /histories/new
  # GET /histories/new.json
  def new
    @history = History.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @history }
    end
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    @history = History.new(history_params)
    @history.user_id=current_user.id

    respond_to do |format|
      if @history.save
        format.html { redirect_to intro_histories_path, notice: '연혁이 작성되었습니다.' }
        format.json { render json: @history, status: :created, location: @history }
      else
        format.html { render action: "new" }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /histories/1
  # PUT /histories/1.json
  def update
    respond_to do |format|
      if @history.update_attributes(history_params)
        format.html { redirect_to intro_histories_path, notice: '연혁이 수정되었습니다.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy

    respond_to do |format|
      format.html { redirect_to intro_histories_path }
      format.json { head :no_content }
    end
  end
  
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_history
    @history = History.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def history_params
    params.require(:history).permit(:year, :title, :content)
  end  
end

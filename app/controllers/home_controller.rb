# encoding: utf-8

class HomeController < ApplicationController
  def initialize(*params)
    super(*params)
    @script='home'
    get_menu('home') 
  end
  
  def index
    @guest_books = GuestBook.order('id desc').page(params[:page]).per(5)
    @notices = Notice.order('id desc').page(params[:page]).per(5)
    @questions = Question.order('id desc').page(params[:page]).per(5)    
    @galleries = Gallery.order('id desc').page(params[:page]).per(20)
  end
end
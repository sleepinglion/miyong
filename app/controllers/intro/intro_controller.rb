# encoding: utf-8

class Intro::IntroController < ApplicationController
  def initialize(*params)
    super(*params)
    @title='라헨'
    @controller_category_name=t(:category_intro)    
    @controller_name='인사말' 
    
    get_menu('intro')
  end  
  
  def index

  end
end

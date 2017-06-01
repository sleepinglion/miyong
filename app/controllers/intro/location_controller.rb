# encoding: utf-8

class Intro::LocationController < ApplicationController
  layout 'location'
  
  def initialize(*params)
    super(*params)
    @script='intro/location'
    @controller_category_name=t(:category_intro)
    @controller_name='찾아오시는 길'
  end
  
  def index
        
  end
end

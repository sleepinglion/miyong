# encoding: utf-8

class ProductComment < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :product  
end

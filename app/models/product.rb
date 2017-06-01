# encoding: utf-8

require 'carrierwave/orm/activerecord'

class Product < ActiveRecord::Base
  validates_presence_of :title, :photo
  belongs_to :gallery_category, :autosave => true, :counter_cache => true  
  has_one :product_content, :foreign_key => :id, :dependent => :destroy
  has_many :product_comment, :dependent => :destroy
  accepts_nested_attributes_for :product_content, :allow_destroy => true
  mount_uploader :photo, ProductUploader 
end

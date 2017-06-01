# encoding: utf-8

class ProductCategory < ActiveRecord::Base
  validates_presence_of :title
  has_many :product, :dependent=> :destroy
end

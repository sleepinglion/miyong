# encoding: utf-8

require 'carrierwave/orm/activerecord'

class BlogCategory < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :blog_category
  has_many :blog_category, :through=> :blog_category_rel, :dependent=>:destroy
  has_many :blog, :dependent=>:destroy
end

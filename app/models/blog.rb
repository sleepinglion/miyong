# encoding: utf-8

require 'carrierwave/orm/activerecord'

class Blog < ActiveRecord::Base
  is_impressionable
  validates_presence_of :title, :description
  belongs_to :user, :autosave=>true
  belongs_to :blog_category, :autosave=>true, :counter_cache => true
  has_one :blog_content, :foreign_key => :id, :dependent => :destroy
  has_many :blog_comment, :dependent=>:destroy
  accepts_nested_attributes_for :blog_content, :allow_destroy => true
  accepts_nested_attributes_for :blog_comment, :allow_destroy => true
  mount_uploader :photo, BlogUploader
end

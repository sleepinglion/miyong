# encoding: utf-8

require 'carrierwave/orm/activerecord'

class Gallery < ActiveRecord::Base
  validates_presence_of :title, :photo
  belongs_to :user, :autosave => true  
  belongs_to :gallery_category, :autosave => true, :counter_cache => true
  mount_uploader :photo, GalleryUploader
end

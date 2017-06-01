# encoding: utf-8

class ProductQuestion < ActiveRecord::Base
  validates_presence_of :title, :name, :password
  has_one :question_content, :foreign_key => :id
  has_many :question_comment
  accepts_nested_attributes_for :question_content, :allow_destroy => true
  accepts_nested_attributes_for :question_comment, :allow_destroy => true  
end

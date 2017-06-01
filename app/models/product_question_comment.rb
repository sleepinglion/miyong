# encoding: utf-8

class ProductQuestionComment < ActiveRecord::Base
  validates_presence_of  :name, :password, :content 
  belongs_to :question, :dependent=>:delete, :autosave=>true  
  accepts_nested_attributes_for :question, :allow_destroy => true  
end

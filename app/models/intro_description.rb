# encoding: utf-8

class IntroDescription < ActiveRecord::Base
  validates_presence_of :title, :description
end

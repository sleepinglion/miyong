# encoding: utf-8

class IntroTitle < ActiveRecord::Base
  validates_presence_of :title
end

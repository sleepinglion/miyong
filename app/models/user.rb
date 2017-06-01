# encoding: utf-8

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatables
  mount_uploader :photo, UserUploader
end

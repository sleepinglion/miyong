# encoding: utf-8

class AddCount < ActiveRecord::Migration
  def change
    add_column :guest_books, :count, :integer, :null=>false, :default=>0
    add_column :notices, :count, :integer, :null=>false, :default=>0
    add_column :questions, :count, :integer, :null=>false, :default=>0        
  end
end
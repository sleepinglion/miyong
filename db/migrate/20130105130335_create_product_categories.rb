# encoding: utf-8

class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :title, :null=>false, :limit=>60
      t.integer :products_count, :null=>false, :default=>0       
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps
    end
  end
end

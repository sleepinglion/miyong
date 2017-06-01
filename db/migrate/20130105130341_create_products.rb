# encoding: utf-8

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :product_category, :null=>false
      t.references :user, :null=>false            
      t.string :title, :null=>false
      t.float :price, :unsigned=>true, :null=>false, :default=>0
      t.text :description, :null=>false
      t.string :photo, :null=>false
      t.timestamps
    end
    
    create_table :product_contents do |t| 
      t.string :content
    end
    
    add_index :products, :product_category_id
    add_index :products, :user_id
  end
end

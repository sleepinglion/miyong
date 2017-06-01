# encoding: utf-8

class CreateProductComments < ActiveRecord::Migration
  def change
    create_table :product_comments do |t|
      t.references :product,:null=>false
      t.string :title, :null=>false, :limit=>60
      t.timestamps
    end
    
    add_index :product_comments, :product_id    
  end
end

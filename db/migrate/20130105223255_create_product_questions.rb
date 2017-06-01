# encoding: utf-8

class CreateProductQuestions < ActiveRecord::Migration
  def change
    create_table :product_questions do |t|
      t.references :product,:null=>false
      t.string :title,:limit=>60,:null=>false
      t.string :name,:limit=>60,:null=>false
      t.string :password,:limit=>40,:null=>false
      t.integer :comment,:default=>0,:null=>false
      t.timestamps
    end
    
    create_table :product_question_contents do |t|
      t.text :content,:null=>false
    end
    
    create_table :product_question_comments do |t|
      t.references :product_question,:null=>false
      t.string :name,:null=>false
      t.string :password,:null=>false
      t.text :content,:null=>false
      t.timestamps
    end
    
    add_index :product_question_comments, :product_question_id 
  end  
end

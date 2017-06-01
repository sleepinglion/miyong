class CreateBlogCategoryRels < ActiveRecord::Migration
  def change
    create_table :blog_category_rels do |t|
      t.references :blog_category, :null=>false
      t.references :blog_category_rel, :null=>false
      t.timestamps
    end
    
    add_index :blog_category_rels, :blog_category_id
    add_index :blog_category_rels, :blog_category_rel_id
  end
end

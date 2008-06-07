class CreateArticlesImages < ActiveRecord::Migration
  def self.up
    create_table :articles_images do |t|
      t.integer :article_id, :parent_id, :size, :width, :height
      t.string :content_type, :filename, :thumbnail      

      t.timestamps
    end
  end

  def self.down
    drop_table :articles_images
  end
end
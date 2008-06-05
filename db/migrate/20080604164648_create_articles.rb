class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.integer :category_id
      t.string :article_code
      t.text :lead
      t.text :content
      t.string :author
      t.integer :show_on_homepage, :limit => 1
      t.integer :show_forever, :limit => 1
      t.date :from_date
      t.date :to_date
      t.float :disorder

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end

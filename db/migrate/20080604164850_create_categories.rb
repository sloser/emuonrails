class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :title
      t.integer :parent_category_id
      t.string :category_code
      t.integer :language_id
      t.integer :show_in_menu, :limit => 1
      t.float :disorder

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end

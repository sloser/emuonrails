class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.boolean :show_comments
      t.boolean :show_related_articles
      t.boolean :show_categories_articles
      t.boolean :use_tags
      t.boolean :use_send_to_friend
    end
  end

  def self.down
    drop_table :settings
  end
end

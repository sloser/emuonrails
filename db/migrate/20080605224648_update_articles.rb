class UpdateArticles < ActiveRecord::Migration
  def self.up
    add_column "articles", "filename", "string" 
  end

  def self.down
    remove_column "articles", "filename"
  end
end

class RemoveFilename < ActiveRecord::Migration
 def self.up
    remove_column "articles", "filename"
  end

  def self.down
    add_column "articles", "filename", "string" 
  end
end

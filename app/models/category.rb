class Category < ActiveRecord::Base
	
	has_many :articles
	acts_as_tree :order=>"title", :foreign_key=>"parent_category_id"	

  named_scope :roots, :conditions => "parent_category_id IS NULL"

  validates_presence_of     :title  
  validates_uniqueness_of   :category_code	
	
end

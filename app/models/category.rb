class Category < ActiveRecord::Base
	
	has_many :articles
	acts_as_tree :order=>"title", :foreign_key=>"parent_category_id"	
	
end

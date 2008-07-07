class Article < ActiveRecord::Base
	
	has_one :articles_image, :dependent => :destroy
	belongs_to 	:category,
				:select => 'title'
				
	named_scope :active, :conditions => "show_forever='1' OR (from_date <= CURRENT_DATE AND to_date > CURRENT_DATE)"				
	
	
	def self.find_all_active_articles(page, limit)
		
		paginate	:select		=> 'id,
									category_id,
									title,
									created_at,
									disorder',
					:conditions => "show_forever='1' OR (from_date <= CURRENT_DATE AND to_date > CURRENT_DATE)",
					:order 		=> 'disorder',					
					:page 		=> page,
					:per_page 	=> limit
	end
	
	
end

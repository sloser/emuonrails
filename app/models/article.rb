class Article < ActiveRecord::Base
	
	#belongs_to :category
	
	def self.find_all
		find 	:all,
				:select	=> 'articles.id,
							articles.category_id,
							articles.title as article_title,
							articles.created_at,
							categories.title as category_title',
				:joins    => "inner join categories on articles.category_id = categories.id" 
	end
	
	
end

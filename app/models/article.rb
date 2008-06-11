class Article < ActiveRecord::Base
	
	has_one :articles_image, :dependent => :destroy
	
	def self.find_all_articles(page, limit)
		
		paginate	:select	=> 'articles.id,
						articles.category_id,
						articles.title as article_title,
						articles.created_at,
						categories.title as category_title',
					:joins  => 'inner join categories on articles.category_id = categories.id',				
					:order 	=> 'articles.id desc',
					:page => page,
					:per_page => limit
	end
	
	
end

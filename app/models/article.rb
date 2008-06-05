class Article < ActiveRecord::Base
	
	#belongs_to :category
	
	%-
	has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>',
                 :thumbnails => { :thumb => '100x100>' }

	validates_as_attachment
	-%
	
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

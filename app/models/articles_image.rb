class ArticlesImage < ActiveRecord::Base
	
	belongs_to :article
	
	has_attachment :content_type => :image, 
                :storage => :file_system,
                :processor => :ImageScience,
                :max_size => 500.kilobytes,
                :resize_to => '420x300>',
				:thumbnails => {
					:l_thumb => '200x200>',
					:s_thumb => '100x100>'
				}

	validates_as_attachment
	
end

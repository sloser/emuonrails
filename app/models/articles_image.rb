class ArticlesImage < ActiveRecord::Base
	
	belongs_to :article
	
	has_attachment :content_type => :image, 
                 :storage => :file_system,
                 :processor => :ImageScience,
                 :max_size => 500.kilobytes,
                 :resize_to => '320x200>',
                 :thumbnails => { :thumb => '100x100>' }

	validates_as_attachment
	
end

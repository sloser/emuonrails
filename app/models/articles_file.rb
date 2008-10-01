class ArticlesFile < ActiveRecord::Base
	
	belongs_to :article
	
	has_attachment :content_type => ['application/pdf', 'application/msword', 'text/plain'],
                :storage => :file_system,                
                :max_size => 2000.kilobytes                

	validates_as_attachment
	
end

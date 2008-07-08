class ArticleService

	attr_reader :article, :image
	
	def initialize(article, image)
		@article = article
		@image = image
	end
	
	def save
		return false unless valid?
		begin
		Article.transaction do
			if @image.valid?
				@article.articles_image.destroy if @article.articles_image
				@image.article = @article
				@image.save!
			end			
			@article.show_forever = '1'
			@article.article_code = @article.title.create_alias	
			@article.save!
			true
		end
		rescue
			false
		end
	end	

	def valid?
		@article.valid? #&& @image.valid?
	end
end

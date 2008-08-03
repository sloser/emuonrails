class ArticleService

	attr_reader :article, :image
	
	def initialize(article, image, article_id = nil, tags = nil)
		@article 		= article
		@image 			= image
    @article_id = article_id
    @tags 			= tags
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
			
			unless @tags.nil?
				@article.tag_list = @tags
			end
			
			
			@article.save!					
			true
		end
		rescue
			false
		end
	end

  def update
		#return false unless valid?
		#begin
		Article.transaction do
			if @image.valid?
				current_article = Article.find @article_id
				current_article.articles_image.destroy if current_article.articles_image
				@image.article = current_article
				@image.save!
			end			
			
			@article['article_code'] = @article['title'].create_alias			
			Article.update(@article_id, @article)
			
			unless @tags.nil?
				tagged_obj = Article.find(@article_id)
				tagged_obj.tag_list = @tags
				tagged_obj.save
			end			
			
			true
		end
		#rescue
		#	false
		#end
	end	

	def valid?
		@article.valid?
	end
end

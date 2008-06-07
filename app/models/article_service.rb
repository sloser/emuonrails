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
			if @image.new_record?
				@article.image.destroy if @article.image
				@image.article = @article
				@image.save!
			end
			@article.save!
			true
		end
		rescue
			false
		end
	end

	def valid?
		@article.valid? && @image.valid?
	end
end
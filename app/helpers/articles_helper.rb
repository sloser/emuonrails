module ArticlesHelper
	
	def show_image_for(article, size = '')
		if article.articles_image			
			image_tag(article.articles_image.public_filename(size))
		else
			image_tag("blank-cover-#{size}.png" )
		end
	end
	
end

class Article < ActiveRecord::Base
	
	acts_as_taggable
	
	has_one 	:articles_image, :dependent => :destroy
	has_many 	:comments
	
	belongs_to 	:category,
							:select => 'title, category_code'
							
	named_scope :active, 	:conditions => "show_forever='1' OR (from_date <= CURRENT_DATE AND to_date > CURRENT_DATE)"	
	named_scope :archive, :conditions => "show_forever='0' OR (from_date > CURRENT_DATE AND to_date <= CURRENT_DATE)"
  
	
	def self.find_all_active_articles(page, limit, archive=nil)
		
    if archive
      active_sql = "show_forever='0' OR (from_date > CURRENT_DATE AND to_date <= CURRENT_DATE)"      
    else    
      active_sql = "show_forever='1' OR (from_date <= CURRENT_DATE AND to_date > CURRENT_DATE)"
    end

		paginate	:select		=> 'id,
														category_id,
														title,
														created_at,
														disorder',
							:conditions => active_sql,
							:order 		=> 'disorder, id DESC',					
							:page 		=> page,
							:per_page 	=> limit
	end
	

  def self.homepage_articles      
  
    find 	:all,
					:select => 'title,
                      category_id,                  
                      article_code',            
					:conditions => 'show_on_homepage = 1'
				                    

  end

  
  def self.category_articles(category_code, article_id=0)      
  
    find	:all,
					:select => 'title,
                      category_id,                  
                      article_code',
          :include => 'category',            
          :conditions => ["categories.category_code = ? AND articles.id != ?", category_code, article_id]                    
  end
  
  
  def self.find_article(category_code, article_code)      
  
    find	:first,
					:select => 'title,
                      category_id,                  
                      article_code',
          :include => 'category',            
          :conditions => ["article_code = ? AND categories.category_code = ?", article_code, category_code]                    
  end
  
  def self.find_related_articles(article)
		
		find_tagged_with(article.tag_list, :conditions => ["articles.id != ?", article.id])                
		
  end
	
end
class ArticlesController < ApplicationController   
  
  before_filter :is_login
  layout "users"
  
  LIMIT = 10
  
  def index    
    %-
    aa = Article.all
    
    for a in aa
      a.show_forever = '1'
      a.save
    end
    -
    
    @articles = Article.find_all_active_articles(params[:page], LIMIT)
    @total_articles = Article.active.count(:id)
    
    respond_to do |format|     
      format.html do
         render :layout => false if params[:ajax]
      end
      format.js do
        render :update do |page|
          page.replace_html 'list_of_articles', :partial => "list"
        end
      end
    end  
    
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.find :all, :select => 'id, title'
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.find :all, :select => 'id, title'    
  end

  def create    
    @article  = Article.new(params[:article])
    @image    = ArticlesImage.new(:uploaded_data => params[:image_name])
    @service  = ArticleService.new(@article, @image)
  
    @article.show_forever = '1'
    
    if @service.save
      redirect_to :action => "index"
    else
      render :action => "new"      
    end    
  end

  def update
    @article = Article.find(params[:id])    
    if @article.update_attributes(params[:article])        
      redirect_to :action => "index"
    else
      render :action => "edit"    
    end    
  end
  
  def archive
    article = Article.find(params[:id])
    #article.date_from = '0000-00-00'
    article.show_forever = '0'
    article.save
    redirect_to :action => "index", :ajax => 1 
  end

  def destroy
  end
  
  def update_positions   
  	params[:main].each_index do |i|
    	item = Article.find(params[:main][i])
    	item.disorder = i + 1
    	item.save  	end    
        
        @articles = Article.find_all_active_articles(params[:page], LIMIT)
		render :layout => false, :action => :index
	end

end

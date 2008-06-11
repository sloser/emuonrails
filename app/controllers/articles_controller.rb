class ArticlesController < ApplicationController   
  
  before_filter :is_login
  layout "users"
  
  def index    
    
    limit = 10            
    @articles = Article.find_all_articles(params[:page], limit)
    @total_articles = Article.count
    
    respond_to do |format|
      format.html 
      format.js do
        render :update do |page|
          page.replace_html 'list_of_articles', :partial => "articles"
        end
      end
    end
    
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
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

  def destroy
  end

end

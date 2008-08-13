class ArticlesController < ApplicationController   
  
  before_filter :is_login
  layout "users"
  uses_tiny_mce(:options => AppConfig.default_mce_options, :only => [:new, :edit])
  
  skip_before_filter :verify_authenticity_token, :only => [:auto_complete_for_tags_tag]
  auto_complete_for :tags, :tag
  
  LIMIT = 10
  
  def index    
    #active_all
    @archive = params[:archive] ? true : false
    @articles = Article.find_all_active_articles(params[:page], LIMIT, @archive)
    if @archive
      @total_articles = Article.archive.count(:id)
    else    
      @total_articles = Article.active.count(:id)
    end  
    
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
    @article    = Article.new
    @categories = Category.find :all, :select => 'id, title'
  end

  def edit
    @article    = Article.find(params[:id])
    @categories = Category.find :all, :select => 'id, title'
    @tags_value = @article.tag_list
  end

  def create    
    @article  = Article.new(params[:article])
    @image    = ArticlesImage.new(:uploaded_data => params[:image_name])
    @tags     = params[:tags][:tag].split(', ').map {|tag| tag.create_alias}
    @service  = ArticleService.new(@article, @image, nil, @tags)            
    
    if @service.save
      redirect_to :action => "index"
    else
      render :action => "new"      
    end    
  end

  def update
    @article_id     = params[:id]
    @article        = params[:article]
    @tags           = params[:tags][:tag].split(', ').map {|tag| tag.create_alias}
    @image          = ArticlesImage.new(:uploaded_data => params[:image_name])
    
    @service        = ArticleService.new(@article, @image, @article_id, @tags)   
    
    if @service.update        
      
      # Expire the article page
      category_alias = Category.find(@article['category_id']).title.create_alias
      expire_page(:controller => category_alias, :action => @article['title'].create_alias)
      
      redirect_to :action => "index"
    else
      render :action => "edit"    
    end    
  end
  
  def archive
    article = Article.find(params[:id])    
    article.show_forever = '0'
    article.save
    redirect_to :action => "index", :ajax => 1 
  end

  def dearchive
    article = Article.find(params[:id])    
    article.show_forever = '1'
    article.save
    redirect_to :controller => "archive", :ajax => 1 
  end

  def delete
    Article.delete(params[:id])    
    redirect_to :controller =>"archive", :ajax => 1
  end
  
  def update_positions   
  	params[:main].each_index do |i|
      item = Article.find(params[:main][i])
      item.disorder = i + 1
      item.save
    end    
        
    @articles = Article.find_all_active_articles(params[:page], LIMIT)
		render :layout => false, :action => :index
  end
  
  def auto_complete_for_tags_tag
    re = Regexp.new("^#{params[:tags][:tag]}", "i")    
    @tags = Article.tag_counts.collect(&:name).select { |tag| tag.match re }
        
    render :inline => "<%= content_tag(:ul, @tags.map { |tag| content_tag(:li, h(tag)) }) %>"
    
  end
  
  private
  
  def active_all
    aa = Article.all
    
    for a in aa
      a.show_on_homepage = '0'
      a.save
    end
  end

end

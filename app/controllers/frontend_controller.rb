class FrontendController < ApplicationController 
  
  def index
    @categories = Category.roots
    @articles = Article.homepage_articles
    @tags = Article.tag_counts
  end

  def overview    
    if params[:tag]
      @articles         = Article.find_tagged_with(params[:tag])      
    else
      @category = Category.find_by_category_code(params[:category_code])
      render :template => 'frontend/error' if @category.nil?    
      @articles = Article.category_articles(params[:category_code])
    end
  end

  def view
    @article = Article.find_article(params[:category_code],params[:article_code])
    render :template => 'frontend/error' if @article.nil?
    
    @settings = Setting.first
    
    @related_articles   = Article.find_related_articles(@article)
    @catagory_articles  = Article.category_articles(params[:category_code], @article.id)
    
    @reffer   = request.env['REQUEST_URI']
    
    @comment  = Comment.new    
    @comments = Comment.find_all_by_article_id(@article.id, :order => 'id DESC')
    
    @tags     = @article.tag_list
    
  end 
  
  def add_comment
    @comment = Comment.new(params[:comment])
    @comment.save
    
    redirect_to params[:reffer]    
  end
  
  def send_mail   
    reffer = request.env['HTTP_REFERER']
    Sender.deliver_send_to_friend(reffer)
    redirect_to '/'    
  end


end

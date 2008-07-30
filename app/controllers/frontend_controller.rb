class FrontendController < ApplicationController

  def index
    @categories = Category.roots
    @articles = Article.homepage_articles
  end

  def overview
    @category = Category.find_by_category_code(params[:category_code])
    render :template => 'frontend/error' if @category.nil?    
    @articles = Article.category_articles(params[:category_code])
  end

  def view
    @article = Article.find_article(params[:category_code],params[:article_code])
    render :template => 'frontend/error' if @article.nil?
    
    @reffer = request.env['REQUEST_URI']
    
    @comment = Comment.new    
    @comments = Comment.find_all_by_article_id(@article.id, :order => 'id DESC')
    
  end
  
  def add_comment
    @comment = Comment.new(params[:comment])
    @comment.save
    
    redirect_to params[:reffer]
    
  end

end

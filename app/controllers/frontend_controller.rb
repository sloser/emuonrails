class FrontendController < ApplicationController

  def index
    @categories = Category.find(:all)
    @articles = Article.homepage_articles
  end

  def overview
    @articles = Article.find_all_by_category_code(params[:category_code])
  end

  def view
    @article = Article.find_by_article_code(params[:article_code])
  end

end

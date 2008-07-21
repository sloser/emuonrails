class FrontendController < ApplicationController

  def index
    @categories = Category.roots
    @articles = Article.homepage_articles
  end

  def overview
    @articles = Article.category_articles(params[:category_code])
  end

  def view
    @article = Article.find_by_article_code(params[:article_code])
  end

end

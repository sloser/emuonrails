require '../test_helper'

class ArticleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_presence_of_article_table
    assert Article.all
  end
  
  def test_article_table_sturcture
    
    a = Article.first
    assert a.title
    assert a.article_code
    assert a.show_on_homepage
    assert a.show_forever

  end

  def test_article_belongs_to_categories
    
    a = Article.homepage_articles
    assert a.category.title

  end

end

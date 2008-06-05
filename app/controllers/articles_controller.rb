class ArticlesController < ApplicationController   
  
  before_filter :is_login
  layout "users"
  
  def index    
    @articles = Article.find_all    
  end

  def show
  end

  def new
    @categories = Category.find :all, :select => 'id, title'
  end

  def edit
    @article = Article.find(params[:id])
    @categories = Category.find :all, :select => 'id, title'
  end

  def create
    @article = Article.new(params[:article])    
    if @article.save
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

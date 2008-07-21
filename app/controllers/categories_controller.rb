class CategoriesController < ApplicationController
  
  layout "users"
  
  def index    
    @categories = Category.find :all        
  end

  def show
  end

  def new
    @category_new = Category.new    
    @categories = Category.find :all, :select => 'id, title'
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.find :all, :select => 'id, title'
  end

  def create
    @category = Category.new(params[:category])
    @category.category_code = @category.title.create_alias       
    
    if @category.save
      redirect_to :action => "index"
    else
      @categories = Category.find :all, :select => 'id, title'
      render :action => "new"      
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.category_code = @category.title.create_alias    
    if @category.update_attributes(params[:category])        
      redirect_to :action => "index"
    else
      render :action => "edit"    
    end  
  end

  def destroy
    Category.delete(params[:id])
    redirect_to :action => "index"
  end

end

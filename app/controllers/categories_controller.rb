class CategoriesController < ApplicationController
  
  layout "users"
  
  def index    
    @categories = Category.find :all        
  end

  def show
  end

  def new
    @categories = Category.find :all, :select => 'id, title'
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.find :all, :select => 'id, title'
  end

  def create
     @category = Category.new(params[:category])
    
    if @category.save
      redirect_to :action => "index"
    else
      render :action => "new"      
    end
  end

  def update
    @category = Category.find(params[:id])    
    if @category.update_attributes(params[:category])        
      redirect_to :action => "index"
    else
      render :action => "edit"    
    end  
  end

  def destroy
  end

end

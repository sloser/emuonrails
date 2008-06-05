class CategoriesController < ApplicationController
  
  layout "users"
  
  def index
    @cnt = 0
    @categories = Category.find :all    
    @total_categories = @categories.size   
  end

  def show
  end

  def new
  end

  def edit
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
  end

  def destroy
  end

end

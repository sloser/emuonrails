module FrontendHelper
 
  def category_tree(parent_tag="ul",child_tag="li")
    
    @parent_open_tag   = "<" + parent_tag + ">\n"
    @parent_close_tag  = "</" + parent_tag + ">\n"  
    @child_open_tag    = "\t<" + child_tag + ">"
    @child_close_tag   = "</" + child_tag + ">\n"

    @tree ||= []
    
	  @tree << @parent_open_tag
    
	  @categories.each do |c|
      @tree << @child_open_tag + link_to(c.title, c.category_code) + @child_close_tag
	    
      get_subs(c)

    end

    @tree << @parent_close_tag
   
    return @tree

  end  

  def get_subs(c)
    
    unless c.children.empty?
      @tree << @parent_open_tag
        
        c.children.each do |sub|
          @tree << @child_open_tag + link_to(sub.title, sub.category_code) + @child_close_tag
          get_subs(sub)
        end     

      @tree << @parent_close_tag  
    end

  end

end

module CreateAlias

  def create_alias   
        
    string = self.to_s    
    
    # map hr letters with url friendly substitute
    letters = {
      'č' => 'c', 'ć' => 'c', 'ž' => 'z', 'š' => 's', 'đ' => 'dj',
      'Č' => 'C', 'Ć' => 'C', 'Ž' => 'Z', 'Š' => 'S', 'Đ' => 'Dj'
    }

    letters.each {|k,v| string = string.gsub(k,v)}
 
    string = string.gsub(/[^\w\s\-\—]/,'')  # remove all non string except for whitespaces, dashes, and hyphens 
    string = string.gsub(/(\s|_)+/, ' ')    # replace all consecutive whitespaces and underscores with a single whitespace 
    string = string.strip                   # strip leading/trailing whitespace 
    string = string.gsub('/\—/', '-')       # replace hyphens with dash 
    string = string.gsub('/\s?-\s?/', '-')  # remove whitespace surrounding dashs 
    string = string.gsub('/(-)+/', '-')     # replace all consecutive dashes with a single dash 
    string = string.gsub(/\s/, '-')         # replace whitespace with hyphen 
    string = string.downcase                # downcase
    return string                           # return the modified string
  end
  
end

# add a method to the Ruby String class
class String
  include CreateAlias
end
module CreateAlias

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, ClassMethods)
  end

  module ClassMethods    

    #class ActiveSupport

      def create_alias(string)     
          
          letters = { 
              'č'   =>  'c',
              'ć'   =>  'c',
              'ž'   =>  'z',
              'š'   =>  's',
              'đ'   =>  'dj',
              'Č'   =>  'C',
              'Ć'   =>  'C',
              'Ž'   =>  'Z',
              'Š'   =>  'S',
              'Đ'   =>  'Dj'    
          }

          letters.each {|k,v| string.gsub!(k,v)}
       
          string.gsub!(/[^\w\s\-\—]/,'') # remove all non string except for whitespaces, dashes, and hyphens 
          string.gsub!(/(\s|_)+/, ' ') # replace all consecutive whitespaces and underscores with a single whitespace 
          string.strip! # strip leading/trailing whitespace 
          string.gsub!('/\—/', '-') # replace hyphens with dash 
          string.gsub!('/\s?-\s?/', '-') # remove whitespace surrounding dashs 
          string.gsub!('/(-)+/', '-') # replace all consecutive dashes with a single dash 
          string.gsub!(/\s/, '-') # replace whitespace with hyphen 
          string.downcase! # downcase bang 
          return string # return the string
      #end

  end

end

end

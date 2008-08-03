class TinyMcePhoto < ActiveRecord::Base
  has_attachment  :storage => :file_system,
                  :content_type => [:image, 'application/x-shockwave-flash'],
                  :processor => :ImageScience,
                  :max_size => 500.kilobytes,
                  :resize_to => '420x300>',
                  :thumbnails => {
                      :thumb  => '100x100>',
                      :medium => '200x200>',
                      :large  => '300x300>'
                  },
                  :path_prefix => 'public/tiny_mce'

  validates_as_attachment

  belongs_to :user
  
  def display_name
    self.name ? self.name : self.created_at.strftime("created on: %m/%d/%y")
  end
end
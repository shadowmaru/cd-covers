class AlbumArtImage < ActiveRecord::Base

  belongs_to :album_art
  
  has_attachment :max_size => 10.kilobytes, 
                 :resize_to => [300,300], 
                 :content_type => :image,
                 :storage => :file_system,
                 :processor => 'MiniMagick',
                 :thumbnails => {:thumb => [150,150] }


end

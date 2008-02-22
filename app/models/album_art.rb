class AlbumArt < ActiveRecord::Base
  
  belongs_to :user
  has_one :album_art_image
 # before_save :set_image_filesize, :set_image_size

  validates_associated :album_art_image
  validates_presence_of :user_id, :album_name, :artist_name, :message => "deve ser preenchido"
  
#  file_column :image, :magick => {
#    :versions => { "thumbnail" => "150x150", "standard" => "300x300>" }
#  }
  
  def set_image_filesize
    self.image_filesize = File.size(self.image("standard")).to_s
  end

  def set_image_size
    image = Magick::Image::read(self.image("standard")).first
    self.image_size = "#{image.columns}x#{image.rows}"
  end
  

end

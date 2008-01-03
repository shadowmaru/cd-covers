class AlbumArt < ActiveRecord::Base
  
  belongs_to :user

  validates_presence_of :user_id, :album_name, :artist_name, :image, :message => "deve ser preenchido"
  
  file_column :image, :magick => {
    :versions => { "thumbnail" => "150x150", "standard" => "300x300>" }
  }
  
  def image_filesize
    File.size(self.image).to_s
  end

  def image_size
    image = Magick::Image::read(self.image).first
    "#{image.columns}x#{image.rows}"
  end
  

end

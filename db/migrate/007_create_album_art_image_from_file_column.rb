class CreateAlbumArtImageFromFileColumn < ActiveRecord::Migration
  def self.up
    for album_art in AlbumArt.find(:all)
      image_filename = select_value "SELECT image FROM album_arts WHERE id = #{album_art.id}" 
      unless image_filename.blank?
        image_path = RAILS_ROOT + "/public/album_art/image/#{album_art.id}/#{image_filename}" 
        image_file = File.open(image_path, 'r')        
        photo = AlbumArtImage.new(:album_art_id => album_art.id)
        photo.set_from_file(image_file)
        photo.save!
      end
    end
  end  
  
  def self.down
    execute "DELETE FROM profile_photos" 
  end
end

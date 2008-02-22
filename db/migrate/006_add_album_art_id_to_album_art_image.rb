class AddAlbumArtIdToAlbumArtImage < ActiveRecord::Migration
  def self.up
    add_column :album_art_images, :album_art_id, :integer
  end

  def self.down
    remove_column :album_art_images, :album_art_id
  end
end

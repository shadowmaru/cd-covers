class RemoveThumbnailFromAlbumArt < ActiveRecord::Migration
  def self.up
    remove_column :album_arts, :thumbnail
  end

  def self.down
    add_column :album_arts, :thumbnail, :string
  end
end

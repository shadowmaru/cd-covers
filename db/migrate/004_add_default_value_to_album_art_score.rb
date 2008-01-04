class AddDefaultValueToAlbumArtScore < ActiveRecord::Migration
  def self.up
    change_column :album_arts, :score, :integer, :null => false, :default => 0
  end

  def self.down
    change_column :album_arts, :score, :integer
  end
end

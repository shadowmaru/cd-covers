class CreateAlbumArts < ActiveRecord::Migration
  def self.up
    create_table :album_arts do |t|
      t.integer :user_id
      t.string :album_name
      t.string :artist_name
      t.string :image
      t.string :image_size
      t.string :image_filesize
      t.string :thumbnail
      t.integer :score
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :album_arts
  end
end

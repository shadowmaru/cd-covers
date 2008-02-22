class AddTableAlbumArtImages < ActiveRecord::Migration
  def self.up
    create_table :album_art_images do |t|
      t.integer :size         # file size in bytes
      t.string :content_type  # mime type, ex: application/mp3
      t.string :filename      # sanitized filename
      t.integer :height       # in pixels
      t.integer :width        # in pixels
      t.integer :parent_id    # id of parent image (on the same table, a self-referencing foreign-key).
                              # Only populated if the current object is a thumbnail.
      t.string :thumbnail     # the 'type' of thumbnail this attachment record describes.
                              # Only populated if the current object is a thumbnail.
    end
  end

  def self.down
    drop_table :album_art_images
  end
end

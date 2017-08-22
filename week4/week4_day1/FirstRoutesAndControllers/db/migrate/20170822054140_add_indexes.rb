class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :artworks, :artist_id
    add_index :artworks, :image_url, unique: true
    add_index :artwork_shares, :artwork_id
    add_index :artwork_shares, :viewer_id
  end
end

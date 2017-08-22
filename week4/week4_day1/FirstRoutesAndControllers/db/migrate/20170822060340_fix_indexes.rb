class FixIndexes < ActiveRecord::Migration[5.1]
  def change
    remove_index :artworks, [:artist_id, :title]
    add_index :artworks, [:title, :artist_id], unique: true
    remove_index :artwork_shares, [:viewer_id, :artwork_id]
    add_index :artwork_shares, [:artwork_id, :viewer_id], unique: true
  end
end

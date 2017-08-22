# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
  validates :artist_id, presence: true
  validates :image_url, presence: true, uniqueness: true
  validates :title, presence: true, uniqueness: {
                                        scope: :artist_id,
                                        messsage: "has an artist already."}

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  def self.artworks_for_user_id(user_id)
    Artwork.left_outer_joins(:artwork_shares)
           .where('(artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id)', user_id: user_id)
           .distinct
  end
end

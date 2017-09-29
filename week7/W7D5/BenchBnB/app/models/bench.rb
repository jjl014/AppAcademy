class Bench < ApplicationRecord
  validates :description, :lng, :lat, :seats, presence: true
  validates :seats, numericality: {only_integer: true}
  def self.in_bounds(bounds)
    top = bounds["northEast"]["lat"]
    right = bounds["northEast"]["lng"]
    left = bounds["southWest"]["lng"]
    bottom = bounds["southWest"]["lat"]
    Bench.where("lat BETWEEN ? AND ? AND lng BETWEEN ? AND ?",
                bottom, top, left, right)
  end
end

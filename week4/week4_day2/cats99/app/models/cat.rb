# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validate :gender, :inclusion

  has_many :cat_rental_requests, dependent: :destroy,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest

  def gender
    unless self.sex == "M" || self.sex == "F"
      errors[:sex] << "Must be M or F"
    end
  end

  def inclusion
    unless COLOR.include?(self.color)
      errors[:color] << "Please enter valid color: #{COLOR}"
    end
  end

  def age
    age = Date.today.year - self.birth_date.year
  end

  def self.colors
    COLOR
  end

  private
  COLOR = %w(red green blue white black)
end

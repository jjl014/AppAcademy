# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  # freeze ensures that constants are immutable
  CAT_COLORS = %w(black white orange brown).freeze

  validates :birth_date, :color, :name, :sex, :user_id, presence: true
  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: %w(M F)
  validates :owner, presence: true

  has_many :rental_requests,
    class_name: :CatRentalRequest,
    dependent: :destroy

  belongs_to :owner,
    foreign_key: :user_id,
    class_name: :User

  def age
    time_ago_in_words(birth_date)
  end
end

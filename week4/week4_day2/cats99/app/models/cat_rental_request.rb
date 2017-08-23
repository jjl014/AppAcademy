# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :inclusion

  belongs_to :cat, foreign_key: :cat_id, class_name: :Cat

  def inclusion
    unless ['PENDING', 'APPROVED', 'DENIED'].include?(self.status)
      errors[:status] << "Not a valid status"
    end
  end

  def overlapping_requests
    CatRentalRequest
      .where.not(id: self.id)
      .where(cat_id: self.cat_id)
      .where.not('start_date > :end_date OR end_date < :start_date',
              start_date: self.start_date, end_date: self.end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where('status = \'APPROVED\'')
  end
end

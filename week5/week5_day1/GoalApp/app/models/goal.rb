# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  private    :boolean          default(FALSE), not null
#  details    :text             not null
#  completed  :boolean          default(FALSE), not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ApplicationRecord
  validates :title, presence: true, length: {minimum: 6}

  belongs_to :author,
    class_name: :User,
    foreign_key: :user_id
end

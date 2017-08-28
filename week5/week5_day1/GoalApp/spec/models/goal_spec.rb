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

require 'rails_helper'

RSpec.describe Goal, type: :model do
  subject(:goal) {
    build(:goal,
    title: "Finish Errthang",
    user_id: user.id)
  }
  
  let(:user) {
    build(:user,
    username: "jimmy",
    password: "good_password")
  }

  describe 'validations' do
    it { should validate_presence_of(:title)}
    it { should validate_length_of(:title).is_at_least(6) }
    it { should belong_to(:author)}
  end
end

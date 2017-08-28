require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) {
    build(:user,
    username: "helloworld",
    password: "good_password")
  }

  describe 'validations' do
    it { should validate_presence_of(:username)}
    # it { should validate_uniqueness_of(:username)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:session_token)}
    # it { should validate_uniqueness_of(:session_token)}
    it { should validate_length_of(:password).is_at_least(6)}
  end

  it 'creates a password_digest when a password is given' do
    expect(user.password_digest).to_not be_nil
  end

  it 'creates a session token before validation' do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe '#is_password?' do
    it 'verifies that a password is valid' do
      expect(user.is_password?("good_password")).to be true
    end

    it 'verifies that a password is invalid' do
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe '::find_by_credentials' do
    before { user.save! }

    it 'returns the user with valid credentials' do
      expect(User.find_by_credentials("helloworld", "good_password")).to eq(user)
    end

    it 'returns nil with invalid credentials' do
      expect(User.find_by_credentials("helloworld", "bad_password")).to be_nil
    end
  end

  describe 'reset_session_token!' do
    it 'resets the session token for the user' do
      current_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(current_token)
    end
  end
end

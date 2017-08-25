# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  attr_reader :password

  #validations occur when the object #save is called
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def self.generate_session_token
    # just generates session token doesnt actually save it to user no assignment
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    #create takes in a recognizeable password string and creates a password object by salting and hashing
    #new also takes the string form of a hashed password and changes it back into a password object
  end

  def is_password?(password)
    #this compares the given password attempt with actual password hash stored in db
    BCrypt::Password.new(self.password_digest).is_password?(password)
    #the is_password? method inside is different than our method
    #this portion Bcrypt::Password.new(self.password_digest) creates the bcrpyt object
    #the Bcrypt::Password#is_password? conerts argument into bcrypt object then checks for match
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name) #this must take a hash, we set the key, and set the argument given as the value
    return nil unless user
    return user if user.is_password?(password) #using method above
    nil
  end


end

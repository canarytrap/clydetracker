require 'digest/sha1'

class User < ActiveRecord::Base

  validates_presence_of     :username
  validates_uniqueness_of   :username

  # virtual attributes need accessors.
  # 'password' is also a virtual attribute
  attr_accessor :password_confirmation

  # need to create a cusom validator because 'password'
  # is not a field in our database,
  # and we are validating the hashed_password value
  validates_confirmation_of :password

  # custom validators we want to call
  validate :password_non_blank

  # automagically called by rails when creating a user
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  # TODO: dissect this!
  # making our own setters/getters
  def password
    @password
  end

  # setting a password automatically creates the hashed password
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  # using our object id as it is typically unique
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
end

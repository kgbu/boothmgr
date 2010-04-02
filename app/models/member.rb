require 'digest/sha1'

class Member < ActiveRecord::Base
  validates_uniqueness_of :name, :email

  attr_accessor :password_confirmation
  validates_confirmation_of :password

#  validate :password_non_blank

  def self.authenticate(name, password)
    member = self.find_by_name(name)
    if member 
      expected_password = encrypted_password(password, member.salt)
      if member.passwordhash != expected_password
        member= nil
      end
    end
    member
  end

  def password 
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.passwordhash = Member.encrypted_password(self.password, self.salt)
  end

private
  def password_non_blank 
    errors.add(:password, "パスワードを入力してください") if passwordhash.blank?
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wssss" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
end

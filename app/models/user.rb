# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#  password        :string
#  remember_token  :string
#  password_digest :string
#  fname           :string
#  lname           :string
#

class User < ActiveRecord::Base

  has_many :sessions

  include UsersHelper

  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6, too_short: "should have at least %{count} characters" }, on: :create

  validates :fname, presence: true, length: { maximum: 50 }
  validates :lname, length: { maximum: 50 } # For parsing reasons lname may not exist

  validate :should_not_have_profanities

  has_secure_password validations: false # Remove need for confirmation

  before_save { create_remember_token if (self.remember_token.blank? && self.password_digest && defined?(self.password_digest)) }
  before_save { |user| user.email = email.downcase }
  
  
  def should_not_have_profanities
    if is_profane_name? fname or is_profane_name? lname
      errors.add(:name, "shouldn't contain profanities")
    end

    if is_profane_name? email
      errors.add(:email, "shouldn't contain profanities")
    end
  end

  def display_name
    return "#{ self.fname } #{ self.lname }"
  end
  alias_method :name, :display_name
  
  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end

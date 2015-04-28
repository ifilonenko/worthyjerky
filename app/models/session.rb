# == Schema Information
#
# Table name: sessions
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  ip_address   :string
#  session_code :string
#  is_active    :boolean
#

class Session < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :session_code

  before_create { self.is_active = true }

  def save_with_session_code
    self.session_code = SecureRandom.urlsafe_base64 unless self.session_code
    self.save
  end
  
  def code
    self.session_code
  end

  def character
    self.user
  end

  def disable
    self.is_active = false
    self.save
  end

end

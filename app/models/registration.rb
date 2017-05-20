class Registration < ApplicationRecord
	has_secure_password
	
	validates :name, :presence => true
	validates :phone, :presence => true, numericality: true
	validates :email, :presence => true,  format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, :presence => true,  :length => {:within => 6..40}
	validates :city, :presence => true
	validates :area, :presence => true
	validates :typeofroom, :presence => true
	before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while Registration.exists?(column => self[column])
end
end

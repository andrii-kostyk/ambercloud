class User < ActiveRecord::Base
	has_secure_password
  has_many :external_apps
	before_create :set_uuid

  def self.generate_token
  	SecureRandom.uuid.gsub(/\-/,'')
  end

  def set_uuid
  	self.uuid = generate
  end

  def app name
    self.external_apps.where(name: name).take
  end

private

  def generate
  	SecureRandom.uuid.gsub(/\-/,'')
  end

end

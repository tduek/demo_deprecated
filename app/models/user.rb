class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :avatar, :uid

  has_attached_file :avatar

  def self.find_by_credentials(creds)
    if creds[:email] && creds[:password]
      User.where(email: creds[:email], password: creds[:password])[0]
    end
  end

  def self.create_from_fb_data(fb_data)
    User.create!(uid: fb_data[:uid])
  end


end

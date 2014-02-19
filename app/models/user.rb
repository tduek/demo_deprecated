class User < ActiveRecord::Base
  attr_accessible :email, :name, :avatar

  has_attached_file :avatar

  def self.find_by_credentials(creds)
    if creds[:username] && creds[:password]
      User.where(username: creds[:username], password: creds[:password])[0]
    end
  end


end

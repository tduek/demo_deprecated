class User < ActiveRecord::Base
  attr_accessible :username, :avatar

  has_attached_file :avatar
end

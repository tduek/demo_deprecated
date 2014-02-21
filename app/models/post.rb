class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id

  include PgSearch
  multisearchable against: [:title, :body]


end

class Post < ActiveRecord::Base

  attr_accessible :content, :title, :comments
  has_many :comments

end

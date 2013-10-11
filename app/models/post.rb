class Post < ActiveRecord::Base

  attr_accessible :content, :title, :comments
  has_many :comments

  scope :newer_posts, lambda { |num| order("created_at DESC").limit(num  => 3) }

end

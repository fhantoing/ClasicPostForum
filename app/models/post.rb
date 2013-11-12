class Post < ActiveRecord::Base

  attr_accessible :content, :title, :comments, :author
  validates :title, :content, :author, :presence => true

  has_many :comments

  scope :newer_posts, lambda { |num| order("created_at DESC").limit(num) }

end

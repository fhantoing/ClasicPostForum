class Comment < ActiveRecord::Base

  attr_accessible :author, :content, :post, :post_id
  belongs_to post

end

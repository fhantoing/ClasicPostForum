require 'spec_helper'

describe "Posts pages" do

  describe "Home page" do

    context "Listing all posts" do

      let!(:post1) { Post.create!(:title => "Post 1", :content => "Post number one") }
      let!(:post2) { Post.create!(:title => "Post 2", :content => "Post number two") }
      let!(:post3) { Post.create!(:title => "Post 3", :content => "Post number three") }

      it "should list all available posts titles" do
          visit root_path
          posts = Post.all
          posts.each do |post|
            page.should have_content post.title
          end
      end

      it "should list all available posts contents" do
          visit root_path
          posts = Post.all
          posts.each do |post|
            page.should have_content post.content
          end
      end





      end

  end


end


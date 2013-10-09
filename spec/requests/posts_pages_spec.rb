require 'spec_helper'

describe "Posts pages" do

  let!(:posts) { FactoryGirl.create_list(:post, 3) }

  subject { page }

  describe "Home page" do

    context "Listing all posts" do

      #let!(:post1) { Post.create!(:title => "Post 1", :content => "Post number one") }
      #let!(:post2) { Post.create!(:title => "Post 2", :content => "Post number two") }
      #let!(:post3) { Post.create!(:title => "Post 3", :content => "Post number three") }
      #let(:posts) { Post.all}

      #let!(:post1) { FactoryGirl.create(:post) }
      #let!(:post2) { FactoryGirl.create(:post) }
      #let!(:post3) { FactoryGirl.create(:post) }
      #let(:posts) { Post.all }

      #let!(:posts) { FactoryGirl.create_list(:post, 3) }

      before do
        visit root_path
      end

      #it "should list all available posts titles" do
          #visit root_path
          #posts = Post.all
          #posts.each do |post|
            #page.should have_content post.title
          #end
      #end


      #it "should list all available posts contents" do
          #visit root_path
          #posts = Post.all
          #posts.each do |post|
            #page.should have_content post.content
          #end
      #end

      #it "should list all available posts" do
        #posts.each do |post|
          #page.should have_content post.title
          #page.should have_content post.content
        #end
      #end

      it "should list all available posts" do
        posts.each do |post|
          #page.should have_selector ".post_title", :text => post.title
          #page.should have_selector ".post_content", :text => post.content

          should have_selector ".post_title", :text => post.title
          should have_selector ".post_content", :text => post.content
        end
      end

    end

  end

  describe "Showing posts" do

    let!(:post) { posts.first }

    context "valid post" do

      #let!(:posts) { FactoryGirl.create_list(:post, 3) }
      #let!(:post) { posts.first }

      before do
        visit root_path
        click_link post.title
        #save_and_open_page
      end

      it "should have post info" do
        should have_content post.title
        should have_content post.content
      end

      it "should be on the post page" do
        should have_selector "title", :text => "#{post.title} - MiBlog"
      end
    end

    context "invalid post" do

      before do
        visit post_path(99)
      end

      it "should redirect to home page" do
        should have_selector "title", :text => "Main - MiBlog"
      end

      it "should alerts us about our error" do
        should have_content "The post doesn't exist."
      end
    end

  end

end


require 'spec_helper'

describe "Posts pages" do

  let!(:posts) { FactoryGirl.create_list(:post, 3) }

  subject { page }

  describe "Create post page" do

    context "Creating an new Post" do

      context "with valid data"  do

        before do
          visit public_post_path
          fill_in "Title", :with => "My First Post"
          fill_in "Content", :with => "This article talks about the creation of the first post"
          fill_in "Author", :with => "fhantoing"
          click_button "Public post"

        end

        it "should create a new post on the page" do
          should have_content "My First Post"
          should have_content "This article talks about the creation of the first post"
          should have_content "fhantoing"
        end

        it "should put a success message on the top" do
          should have_content "Post created successfully."
        end
      end

      context "with invalid data" do

        before do
          visit public_post_path
          click_button "Public post"
        end

        it "should put an error message on the top" do
          should have_content "Post title, content and author are required."
        end
      end
    end
  end

  describe "Default page" do

    context "Listing all posts" do

      before do
        visit root_path
      end

      it "should list all available posts" do
        posts.each do |post|
          should have_selector ".post_title", :text => post.title
          should have_selector ".post_content", :text => post.content
        end
      end
    end

    context "Listing last 3 posts" do

      let!(:older_posts) { FactoryGirl.create_list(:post, 2, :created_at => 3.months.ago )}

      before do
        visit root_path
        click_link "View the last 3 Posts created"
      end

      it "should contain the 3 newer posts" do
        posts.each do |post|
          should have_selector ".post_title", :text => post.title
          should have_selector ".post_content", :text => post.content
        end
      end

      it "should not contain that 2 older posts" do
        older_posts.each do |post|
          should_not have_selector ".post_title", :text => post.title
          should_not have_selector ".post_content", :text => post.content
        end
      end
    end

  end

  describe "Showing posts" do

    let!(:post) { posts.first }

    context "valid post" do

      before do
        visit root_path
        click_link post.title
        #save_and_open_page
      end

      it "should have post info" do
        should have_content post.title
        should have_content post.content
        should have_content post.author
      end

      it "should be on the post page" do
        should have_selector "title", :text => "#{post.title}"
      end
    end

    context "invalid post" do

      before do
        visit post_path(99)
      end

      it "should redirect to home page" do
        should have_selector "title", :text => "Main - Posts"
      end

      it "should alerts us about our error" do
        should have_content "The post doesn't exist."
      end
    end

    describe "Comments" do

      context "comments list" do

        let!(:comments) { FactoryGirl.create_list(:comment, 5, :post => post) }

        before do
          visit post_path post
        end

        it "should have a list of comments" do
          comments.each do |comment|
            should have_content comment.author
            should have_content comment.content
          end
        end
      end

      context "Creating comments" do

        context "with valid data"  do

          before do
            visit post_path post
            fill_in "Author", :with => "fhantoing"
            fill_in "Content", :with => "This article is very good, so complete!"
            click_button "Public comment"
          end

          it "should put a new comment on the page" do
            should have_content "fhantoing"
            should have_content "This article is very good, so complete!"
          end

          it "should put a success message on the top" do
            should have_content "Comment created successfully."
          end
        end

        context "with invalid data" do

          before do
            visit post_path post
            click_button "Public comment"
          end

          it "should put an error message on the top" do
            should have_content "Comment needs an author and content."
          end
        end
      end

      context "Creating comments via ajax", :js => true do

        context "with valid data" do

          before do
            visit post_path post
            fill_in "Author", :with => "fhantoing"
            fill_in "Content", :with => "This article is very good, so complete"
            click_button "Public comment"
          end

          it "should put a new comment on the page" do
            should have_content "fhantoing"
            should have_content "This article is very good, so complete"
          end
        end
      end

    end

  end
end


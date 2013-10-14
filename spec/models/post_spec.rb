require 'spec_helper'

describe Post do

  describe "returning X newer posts" do

    let!(:newer_posts) { FactoryGirl.create_list(:post, 3) }
    let!(:older_posts) { FactoryGirl.create_list(:post, 2, :created_at => 2.weeks.ago) }

    let!(:three_last) { Post.newer_posts(3) }

    it "should include the newer posts but no the olders" do
      (newer_posts.to_a - three_last.to_a).should be_empty
    end

    it "should not include any older post" do
      (three_last.to_a -  older_posts.to_a).should_not be_empty
    end
  end
end


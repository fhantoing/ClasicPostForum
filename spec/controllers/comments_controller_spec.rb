require 'spec_helper'

describe CommentsController do

  describe "Creating new comments with Ajax" do

    let!(:a_post) { FactoryGirl.create(:post) }

    it "should increment the comments count" do
      expect do
        xhr :post, :create, { :post_id => a_post.id, :comment => { :author => "fhantoing", :content => "One comment from ajax"} }
      end.should change(Comment, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, { :post_id => a_post.id, :comment => { :author => "fhantoing", :content => "One comment from ajax"} }
      response.should be_success
    end
  end
end


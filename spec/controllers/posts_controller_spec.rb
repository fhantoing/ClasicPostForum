require 'spec_helper'

=begin

describe PostsController do

  describe "show" do

    before do
      get :show, :id => 99
    end

    it "redirects to the home page" do
      response.should redirect_to(root_path)
    end

    it "shows an error" do
      flash[:error].should eql("The post doesn't exist.")
    end
  end
end

=end


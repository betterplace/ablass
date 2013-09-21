require 'spec_helper'

describe DonationsController do
  describe "POST 'create'" do
    it "returns http success" do
      pending
      #post 'create'
      #response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      pending
      #get 'show'
      #response.should be_success
    end
  end

  describe 'helper methods' do
    let :sin_project do
      FactoryGirl.build(:sin_project)
    end

    it 'builds an URL to the donation form' do
      expect(controller.__send__(:betterplace_donation_url, sin_project)).to\
        match URI::DEFAULT_PARSER.regexp[:ABS_URI]
    end
  end
end

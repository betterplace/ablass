require 'spec_helper'

describe DonationsController, type: :controller do
  describe "POST 'create'" do
    it "returns http success" do
      pending
      post 'create'
      expect(response).to be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      pending
      get 'show'
      expect(response).to be_success
    end
  end

  describe 'helper methods' do
    let :sin_project do
      FactoryGirl.build(:sin_project)
    end

    it 'builds an URL to the donation form' do
      expect(described_class.new.__send__(:betterplace_donation_url, sin_project)).to\
        match URI::DEFAULT_PARSER.regexp[:ABS_URI]
    end
  end
end

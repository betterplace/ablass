require 'spec_helper'

describe DonationsHelper, type: :helper do
  describe '#facebook_share_url' do
    it "builds an URL to the project's betterplace page" do
      expect(facebook_share_url).to match URI::DEFAULT_PARSER.regexp[:ABS_URI]
    end
  end
end

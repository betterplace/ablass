require 'spec_helper'

describe Donation do
  let :donation do FactoryGirl.build(:donation) end

  it "can be found via its token" do
    expect(donation.save).to be_true
    expect(Donation.find_by_token(donation.token)).to eq donation
  end
end

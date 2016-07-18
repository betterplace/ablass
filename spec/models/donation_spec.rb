require 'spec_helper'

describe Donation, type: :helper do
  let :donation do FactoryGirl.build(:donation) end

  describe 'Finding' do
    it "can be found via its token" do
      expect(donation.save).to eq true
      expect(Donation.find_by_token(donation.token)).to eq donation
    end
  end

  describe 'Syncing the amount' do
    let :response do
      d = double('Donation')
      allow(d).to receive(:amount_in_cents).and_return 666_00
      JSON::GenericObject[data: [ d ]]
    end

    it 'can sync the amount' do
      expect_any_instance_of(BetterplaceApi).to receive(:get).with(
        "/clients/ablass/client_donations",
        params: { facets: "client_reference:#{donation.token}" }
      ).and_return(response)
      donation.sync_amount
      expect(donation.amount_in_cents).to eq response.data.first.amount_in_cents
    end

    it 'can sync the amount in the background' do
      expect_any_instance_of(BetterplaceApi).to receive(:get).with(
        "/clients/ablass/client_donations",
        params: { facets: "client_reference:#{donation.token}" }
      ).and_return(response)
      donation.sync_amount_in_background.join
      expect(donation.amount_in_cents).to eq response.data.first.amount_in_cents
    end
  end
end

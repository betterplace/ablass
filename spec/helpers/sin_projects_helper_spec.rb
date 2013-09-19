require 'spec_helper'

describe SinProjectsHelper do
  let :sin_project do
    FactoryGirl.build(:sin_project)
  end

  # TODO move into controller spec ? 
  #describe '#betterplace_donation_url' do
  #  it 'build an URL to the donation form' do
  #    expect(betterplace_donation_url(sin_project)).to be_a URI::HTTP
  #  end
  #end

  describe '#betterplace_platform_url' do
    it "build an URL to the project's betterplace page" do
      expect(betterplace_platform_url(sin_project)).to be_a URI::HTTP
    end
  end
end

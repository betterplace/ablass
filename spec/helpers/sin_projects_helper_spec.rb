require 'spec_helper'

describe SinProjectsHelper do
  let :sin_project do
    FactoryGirl.build(:sin_project)
  end

  describe '#betterplace_platform_url' do
    it "builds an URL to the project's betterplace page" do
      expect(betterplace_platform_url(sin_project)).to be_a URI::HTTP
    end
  end
end

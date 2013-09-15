require 'spec_helper'

describe Sin do
  let :sin do FactoryGirl.build(:sin) end

  it "has a name present" do
    expect(sin.name).to be_present
  end
end

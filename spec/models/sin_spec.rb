require 'spec_helper'

describe Sin do
  let :sin do FactoryGirl.build(:sin) end

  it "has a name present" do
    expect(sin.name).to be_present
    expect(sin).to be_valid
    sin.name = ''
    expect(sin).not_to be_valid
  end
end

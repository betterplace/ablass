require 'spec_helper'

describe Sin do
  let :sin do FactoryGirl.build(:sin) end

  it "has a name present" do
    expect(sin.name).to be_present
    expect(sin).to be_valid
    sin.name = ''
    expect(sin).not_to be_valid
  end

  it "has name as a parameter" do
    expect(sin.to_param).to eq sin.name
  end

  it "can be found via its parameter" do
    expect(sin.save).to be_true
    expect(Sin.find_by_param(sin.to_param)).to eq sin
  end
end

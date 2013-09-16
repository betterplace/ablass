require 'spec_helper'

describe Flame do
  it "has a positive amount in cents" do
    f = FactoryGirl.build(:flame, amount_in_cents: 20_00)
    expect(f).to be_valid
    f.amount_in_cents = 0
    expect(f).to have(1).error_on(:amount_in_cents)
  end

  it "is ordered by amount in cents" do
    f1 = FactoryGirl.create(:flame, amount_in_cents: 20_00)
    f2 = FactoryGirl.create(:flame, amount_in_cents: 10_00)
    expect(Flame.all.to_a).to eq [ f2, f1 ]
  end
end

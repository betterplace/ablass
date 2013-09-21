FactoryGirl.define do
  factory :donation do
    association      :sin_project
    amount_in_cents  25_00
    token            { Tins::Token.new(length: 22) }
  end
end


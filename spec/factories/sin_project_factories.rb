FactoryGirl.define do
  factory :sin_project do
    association :sin
    name { |i| "Sin Project ##{i}" }
    description 'Some Description'
    betterplace_id { rand(9_999) }
  end
end

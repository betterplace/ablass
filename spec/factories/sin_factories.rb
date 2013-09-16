FactoryGirl.define do
  factory :sin do
    name { |i| "Sin ##{i}" }
    explanation 'some explanation'
  end
end

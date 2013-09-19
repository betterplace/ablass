FactoryGirl.define do
  factory :sin do
    name { |i| "Sin ##{i}" }
    explanation 'some explanation'
    icon { File.open(Rails.root + 'spec/assets/dummy.png') }
  end
end

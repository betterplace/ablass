FactoryGirl.define do
  factory :sin_project do
    association :sin
    name { |i| "Sin Project ##{i}" }
    description 'Some Description'
    betterplace_id { rand(9_999) }
    small_picture { File.open(Rails.root + 'spec/assets/dummy.png') }
    big_picture { File.open(Rails.root + 'spec/assets/dummy.png') }
  end
end

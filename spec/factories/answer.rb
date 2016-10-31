FactoryGirl.define do
  factory :answer do
    text  Faker::Lorem.sentence(3, true, 4)
  end
end
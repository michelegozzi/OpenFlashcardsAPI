FactoryGirl.define do
  factory :question do
    text  Faker::Lorem.sentence(3, true, 4)+"?"
    
    after(:create) do |instance|
      3.times { instance.answers << FactoryGirl.create(:answer) }          
    end
  end
end
FactoryGirl.define do
  factory :user do
    
    id SecureRandom.hex
    name Faker::Name.name
    email Faker::Internet.free_email
    
    after(:create) do |instance|
      1.times { instance.api_keys << FactoryGirl.create(:api_key) }          
    end
  end
end
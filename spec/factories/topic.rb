FactoryGirl.define do
  factory :topic do
    # [{"name":"US Citizenship Civic Test","id":{"$oid":"57f54e1a9a158d0003000000"},"description":"Civics (History and Government) Questions for the Naturalization Test"}]
    name "US Citizenship Civic Test" #Faker::Lorem.sentence(3, true, 4)
    description "Civics (History and Government) Questions for the Naturalization Test" # Faker::Lorem.sentence(4, true, 8)
    
    after(:create) do |instance|
      1.times { instance.questions << FactoryGirl.create(:question) }          
    end
  end
end
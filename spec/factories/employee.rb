FactoryBot.define do
  factory :employee do
    name { 'Ororo' }
    email { Faker::Internet.email }
    enterprise_id { 3 }
  end
end 
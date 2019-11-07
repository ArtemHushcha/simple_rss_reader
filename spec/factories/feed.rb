FactoryBot.define do
  factory :feed do
    url { Faker::Internet.url }
    title { Faker::Lorem.sentence }
  end
end

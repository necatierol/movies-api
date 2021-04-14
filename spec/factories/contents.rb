FactoryBot.define do
  factory :content do
    title { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
  end
end

FactoryBot.define do
  factory :season do
    title { Faker::Movies::LordOfTheRings.location }
    content_id { nil }
  end
end

FactoryBot.define do
  factory :movie_theater do
    sequence(:name) { |n| "movie_theater#{n}" }
    picture { FileSpecHelper.image }
    banner { FileSpecHelper.image }
  end
end

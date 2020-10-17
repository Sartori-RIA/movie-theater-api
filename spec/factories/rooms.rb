FactoryBot.define do
  factory :room do
    sequence(:name) { |n| "category_#{n}" }

    movie_theater
  end
end

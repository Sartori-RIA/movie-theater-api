FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:summary) { |n| "summary_#{n}" }
    age_classification { Movie.age_classifications.keys.sample }
    banner { FileSpecHelper.image }
  end
end

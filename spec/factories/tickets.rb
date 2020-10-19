FactoryBot.define do
  factory :ticket do
    session
    seat { 1 }
    half { false }
  end
end

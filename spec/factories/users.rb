# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    sequence(:cell_phone) { |n| "#{Faker::PhoneNumber.cell_phone}#{n}" }
    password { '123123123' }
  end
end

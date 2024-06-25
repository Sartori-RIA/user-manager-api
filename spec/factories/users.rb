# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    sequence(:email) { |n| "email#{n}@example.com" }
    phone { 'MyString' }
    born_date { '2024-06-24' }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { 'MyString' }
    phone { 'MyString' }
    born_date { '2024-06-24' }
  end
end

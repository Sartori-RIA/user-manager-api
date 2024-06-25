# frozen_string_literal: true

namespace :db do
  desc 'Erase and Fill database'
  task populate: :environment do
    User.delete_all

    100.times do
      name = Faker::Movies::StarWars.character
      email = Faker::Internet.email(name:)
      phone = Faker::PhoneNumber.cell_phone
      born_date = 20.years.ago.to_date
      password = "abc123"
      User.create(email:, name:, born_date:, phone:, password:)
    end
  end
end

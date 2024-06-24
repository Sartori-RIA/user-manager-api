# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, :born_date, :phone, presence: true
  validates :email, uniqueness: true, email: true
end

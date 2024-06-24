# frozen_string_literal: true

class User < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by, against: [:name, :email]

  validates :name, :email, :born_date, :phone, presence: true
  validates :email, uniqueness: true, email: true
end

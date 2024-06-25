# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :argon2

  include PgSearch::Model
  pg_search_scope :search_by, against: %i[name email]

  validates :name, :email, :born_date, :phone, presence: true
  validates :email, uniqueness: true, email: true
end

# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :argon2,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  include PgSearch::Model
  pg_search_scope :search_by, against: %i[name email]

  validates :name, :born_date, :phone, presence: true
  validates :email, email: true, presence: true
end

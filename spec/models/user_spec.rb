# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe '#validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:born_date) }

    it 'validate valid email' do
      user = build(:user, email: 'example@example.com')
      expect(user).to be_valid
    end

    it 'validate invalid email' do
      user = build(:user, email: 'potato')
      expect(user).not_to be_valid
    end
  end
end

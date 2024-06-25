# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ability, type: :ability do
  describe 'abilities' do
    subject { described_class.new(create(:user)) }

    context 'can' do
      it { is_expected.to be_able_to(:manage, User.new) }
    end
  end
end

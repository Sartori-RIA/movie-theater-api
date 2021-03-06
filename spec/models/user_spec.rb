# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validate_presence_of(:email) }
      it { is_expected.to validate_presence_of(:cell_phone) }
      it { is_expected.to validate_presence_of(:password) }
    end

    context 'with be unique' do
      it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
      it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
      it { is_expected.to validate_uniqueness_of(:cell_phone).ignoring_case_sensitivity }
    end
  end
end

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'with be unique' do
      it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
    end

    context 'with be has associations' do
      it { is_expected.to have_many(:movies) }
      it { is_expected.to have_many(:movies).through(:movie_categories) }
    end
  end
end

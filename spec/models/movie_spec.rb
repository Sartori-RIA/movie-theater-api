require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:summary) }
      it { is_expected.to validate_presence_of(:age_classification) }
      it { is_expected.to validate_presence_of(:banner) }
    end

    context 'with be unique' do
      it { is_expected.to validate_uniqueness_of(:title).ignoring_case_sensitivity }
    end
  end
end

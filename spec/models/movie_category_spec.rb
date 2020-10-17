require 'rails_helper'

RSpec.describe MovieCategory, type: :model do
  describe '.validations' do
    context 'with be has associations' do
      it { is_expected.to belong_to(:category) }
      it { is_expected.to belong_to(:movie) }
    end
  end
end

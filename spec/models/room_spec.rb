require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'with be has associations' do
      it { is_expected.to belong_to(:movie_theater) }
      it { is_expected.to have_many(:sections) }
    end
  end
end

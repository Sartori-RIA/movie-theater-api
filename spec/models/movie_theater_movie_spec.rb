require 'rails_helper'

RSpec.describe MovieTheaterMovie, type: :model do
  describe '.validations' do
    context 'with be has associations' do
      it { is_expected.to belong_to(:movie_theater) }
      it { is_expected.to belong_to(:movie) }
    end
  end
end

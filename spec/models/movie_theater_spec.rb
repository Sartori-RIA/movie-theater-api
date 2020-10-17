require 'rails_helper'

RSpec.describe MovieTheater, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validate_presence_of(:name) }
    end

    context 'with be has associations' do
      it { is_expected.to have_many(:rooms) }
      it { is_expected.to have_many(:movies).through(:movie_theater_movies) }
    end
  end
end

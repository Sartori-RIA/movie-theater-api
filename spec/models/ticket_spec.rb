require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe '.validations' do
    context 'with be has presence' do
      it { is_expected.to validates_numericality_of :seat, only_integer: true, greater_than: 0 }
    end

    context 'with be has associations' do
      it { is_expected.to belong_to(:section) }
    end
  end
end

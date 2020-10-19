class Ticket < ApplicationRecord
  acts_as_paranoid

  validates :seat, presence: true, numericality: {only_integer: true, greater_than: 0}

  belongs_to :session

end

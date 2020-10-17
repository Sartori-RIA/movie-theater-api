class Room < ApplicationRecord
  acts_as_paranoid

  validates :name, :limit, presence: true
  validates :limit, numericality: {only_integer: true, greater_than: 0}
  belongs_to :movie_theater

  has_many :sections
end

class Room < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true
  belongs_to :movie_theater

  has_many :sections
end

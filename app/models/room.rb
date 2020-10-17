class Room < ApplicationRecord
  validates :name, presence: true
  belongs_to :movie_theater
end

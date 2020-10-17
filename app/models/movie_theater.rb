class MovieTheater < ApplicationRecord
  acts_as_paranoid

  mount_uploader :picture, ImageUploader
  mount_uploader :banner, ImageUploader

  validates :name, presence: true

  has_many :rooms
  has_many :movie_theater_movies
  has_many :movies, through: :movie_theater_movies
end

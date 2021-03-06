class Movie < ApplicationRecord
  mount_uploader :banner, ImageUploader

  enum age_classifications: %w[0 10 12 14 16 18]

  validates :age_classification, presence: true, inclusion: {in: age_classifications.keys}
  validates :title, :summary, :age_classification, :banner, presence: true
  validates :title, uniqueness: true

  has_many :sections
  has_many :movie_theater_movies
  has_many :movie_theaters, through: :movie_theater_movies
  has_many :movie_categories
  has_many :categories, through: :movie_categories
end

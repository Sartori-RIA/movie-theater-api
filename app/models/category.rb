class Category < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true, uniqueness: true

  has_many :movies

  has_many :movie_categories
  has_many :movies, through: :movie_categories
end

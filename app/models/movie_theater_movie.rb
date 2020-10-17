class MovieTheaterMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :movie_theater
end

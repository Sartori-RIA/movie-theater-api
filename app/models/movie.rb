class Movie < ApplicationRecord
  mount_uploader :banner, ImageUploader

  enum age_classifications: %w[0 10 12 14 16 18]

  validates :age_classification, presence: true, inclusion: {in: age_classifications.keys}
  validates :title, :summary, :age_classification, :banner, presence: true
  validates :title, uniqueness: true

  has_many :sections
end

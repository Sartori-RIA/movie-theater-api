class MovieTheater < ApplicationRecord
  mount_uploader :picture, ImageUploader
  mount_uploader :banner, ImageUploader

  validates :name, presence: true

  acts_as_paranoid

end

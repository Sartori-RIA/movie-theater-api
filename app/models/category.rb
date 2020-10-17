class Category < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true, uniqueness: true

  has_many :movies
end

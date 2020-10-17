class Section < ApplicationRecord
  acts_as_paranoid

  validates :start_date, :end_date, presence: true
  validates :end_date, date: {after_or_equal_to: :start_date}

  belongs_to :room
  belongs_to :movie

end

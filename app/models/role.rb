# frozen_string_literal: true

class Role < ApplicationRecord
  acts_as_paranoid

  validates :name, uniqueness: true, presence: true

end

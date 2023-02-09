class Cat < ApplicationRecord
  validates :name, presence: true
  # required, greater than 0, integer
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end

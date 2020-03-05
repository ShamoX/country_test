class Country < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, length: { is: 2 }, uniqueness: { case_sensitive: false }
  validates :inhabitants, presence: true, numericality: { greater_than_or_equals_to: 0 }
end

class Country < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, length: { is: 2 }, uniqueness: { case_sensitive: false }
end

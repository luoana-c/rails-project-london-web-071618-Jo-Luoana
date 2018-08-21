class Foodster < ApplicationRecord
  has_many :orders
  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
end

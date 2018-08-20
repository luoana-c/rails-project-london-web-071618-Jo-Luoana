class Cookster < ApplicationRecord
  has_many :orders
  has_many :recipes
  has_many :foodsters, through: :orders
end

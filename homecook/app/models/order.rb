class Order < ApplicationRecord
  belongs_to :cookster
  belongs_to :foodster
  has_many :order_recipes
  has_many :recipes, through: :order_recipes
end

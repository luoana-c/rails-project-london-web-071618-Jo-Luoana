class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :order_recipes
  has_many :orders, through: :order_recipes
  belongs_to :cookster
end

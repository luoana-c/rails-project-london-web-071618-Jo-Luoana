class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :unit_type, presence: true

  def ingredient_count(recipe)
    self.recipe_ingredients.find {|r_i| r_i.recipe == recipe}.ingredient_count
  end
end

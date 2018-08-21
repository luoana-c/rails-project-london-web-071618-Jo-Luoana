class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :order_recipes
  has_many :orders, through: :order_recipes
  belongs_to :cookster

  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :cuisine_type, presence: true

  # def self.cuisine_types
  #   Recipe.all.map{|recipe| recipe.cuisine_type}.uniq
  # end

  def cuisine_types
    [
      "indian",
      "italian",
      "vegetarian",
      "japanese",
      "french",
      "pasta",
      "kebab"
    ]
  end
end

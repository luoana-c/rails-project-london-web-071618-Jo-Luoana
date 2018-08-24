class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :order_recipes
  has_many :orders, through: :order_recipes
  belongs_to :user

  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :cuisine_type, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 0}


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

  def number_recipes
      self.order_recipes.first.recipe_count
  end

  def count_recipes(order)
      self.order_recipes.find{|o_r| o_r.recipe_id == self.id && o_r.order_id == order.id}.recipe_count
  end

  def self.most_popular_recipe
    # hash = {}
    # Recipe.all.each{|recipe| hash[recipe.id] = recipe.orders.count}
    # hash
    recipe_counts = Recipe.all.map{|recipe|recipe.orders.count}
    most_popular = Recipe.select {|recipe| recipe.orders.count == recipe_counts.max}
  end


end

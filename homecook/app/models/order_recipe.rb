class OrderRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :order

  validates :recipe_count, numericality: {only_integer: true, greater_than: 0}
end

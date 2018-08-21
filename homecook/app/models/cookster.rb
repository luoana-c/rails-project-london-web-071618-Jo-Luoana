class Cookster < ApplicationRecord
  has_many :orders
  has_many :recipes
  has_many :foodsters, through: :orders

  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :address, presence: true

  def cuisine_types
    self.recipes.map {|recipe| recipe.cuisine_type}.uniq
  end
end

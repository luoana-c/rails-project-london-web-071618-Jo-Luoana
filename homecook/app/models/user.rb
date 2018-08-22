class User < ApplicationRecord
  has_many :orders
  has_many :recipes
  has_secure_password
  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :address, presence: true

  def cuisine_types
    self.recipes.map {|recipe| recipe.cuisine_type}.uniq
  end

end

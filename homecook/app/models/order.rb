class Order < ApplicationRecord
  has_many :order_recipes
  has_many :recipes, through: :order_recipes


  def order_cookster
    User.find(self.cookster_id)
  end

  def order_foodster
    User.find(self.foodster_id)
  end

  def nice_date(date)
    date.strftime("%d %B %y at %H:%M")
  end

  def self.users_orders(user)
      Order.all.select{|order| order.cookster_id == user.id || order.foodster_id == user.id }
  end

  def order_total
    self.recipes.map {|recipe|
      recipe.recipe_count * recipe.price
    }.reduce(:+)
  end

  def create_order_recipe(hash)
      hash.each do |recipe_id, recipe_count|
        current_or = OrderRecipe.create(order_id: self.id, recipe_id: recipe_id, recipe_count: recipe_count)
        if current_or.recipe_count == nil
          current_or.update(recipe_count: 1)
        end
      end
  end

end

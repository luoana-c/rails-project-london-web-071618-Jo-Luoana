class Order < ApplicationRecord
  has_many :order_recipes
  has_many :recipes, through: :order_recipes

  # validate :has_order_recipe

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
      recipe.count_recipes(self) * recipe.price
    }.reduce(:+)
  end

  def create_order_recipe(id_arr, amount_arr)
    amount_arr.each_with_index do |amount, index|
        if amount != "" && id_arr[index] !=nil
          OrderRecipe.create(order_id: self.id, recipe_id: id_arr[index], recipe_count: amount)
        elsif id_arr[index] != nil
          OrderRecipe.create(order_id: self.id, recipe_id: id_arr[index])
        end

    end
  end

  def has_order_recipe
      if OrderRecipe.all.find{|o_r| o_r.order_id == self.id} == nil
        errors.add(:order_recipe_error, "Please select at least 1 recipe and amount.")
      end
  end

end

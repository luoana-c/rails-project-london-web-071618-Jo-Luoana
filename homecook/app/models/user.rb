class User < ApplicationRecord
  has_many :orders
  has_many :recipes
  has_secure_password
  validates :name, presence: true, uniqueness: true, length: {minimum: 2}
  validates :address, presence: true

  def cuisine_types
    self.recipes.map {|recipe| recipe.cuisine_type}.uniq
  end

  def self.cooksters
    User.all.select{|user| user.cookster == true}
  end

  def self.most_popular_cooks
    hash = {}
    User.cooksters.each do |cookster|
      Order.all.each{|order|
        if order.cookster_id == cookster.id
          if hash[order.cookster_id] == nil
          hash[cookster.id] = 1
          else
          hash[cookster.id] += 1
          end
        end}
    end
    hash.select{|k,v| k if v == hash.values.max }
  end

  def cooksters_most_popular_recipe
    recipe_counts = self.recipes.map{|recipe|recipe.orders.count}
    most_popular = self.recipes.select {|recipe| recipe.orders.count == recipe_counts.max}
  end

  def average_cost_recipes
    prices = self.recipes.map{|recipe| recipe.price }
    if prices.empty?
      return 0
    else
      prices.reduce(:+)/prices.length
    end
  end

  def average_order_total
    users_orders = Order.users_orders(self).map{|order| order_total}
    if users_orders.empty?
      return 0
    else
      users_orders.reduce(:+)/users_orders.length
    end
  end

end

class ChangeRecipeCountColumnDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :order_recipes, :recipe_count, :integer, :default => 1
  end
end

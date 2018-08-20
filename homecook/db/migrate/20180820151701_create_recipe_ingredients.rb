class CreateRecipeIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :ingredient_count
      t.belongs_to :recipe
      t.belongs_to :ingredient
      t.timestamps
    end
  end
end

class CreateOrderRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :order_recipes do |t|
      t.integer :recipe_count
      t.belongs_to :order
      t.belongs_to :recipe

      t.timestamps
    end
  end
end

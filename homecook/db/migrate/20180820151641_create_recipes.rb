class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :cuisine_type
      t.belongs_to :user
      t.integer :price
      t.timestamps
    end
  end
end

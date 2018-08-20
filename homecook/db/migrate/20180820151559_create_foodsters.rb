class CreateFoodsters < ActiveRecord::Migration[5.2]
  def change
    create_table :foodsters do |t|
      t.string :name

      t.timestamps
    end
  end
end

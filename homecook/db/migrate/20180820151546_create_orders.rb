class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :datetime
      t.integer :amount
      t.belongs_to :cookster
      t.belongs_to :foodster

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :datetime
      t.integer :foodster_id
      t.integer :cookster_id


      t.timestamps
    end
  end
end

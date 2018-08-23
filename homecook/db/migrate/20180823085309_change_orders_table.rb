class ChangeOrdersTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :datetime, :datetime_order_placed
    add_column :orders, :datetime_status_order, :datetime
  end
end

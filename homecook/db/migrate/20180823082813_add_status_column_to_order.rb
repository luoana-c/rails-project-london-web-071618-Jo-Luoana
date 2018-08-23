class AddStatusColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :status, :string, :default => "Order Placed"
  end
end

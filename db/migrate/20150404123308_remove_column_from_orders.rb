class RemoveColumnFromOrders < ActiveRecord::Migration
  def down
    remove_column :orders, :type
  end
end

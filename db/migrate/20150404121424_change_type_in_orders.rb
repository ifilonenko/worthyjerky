class ChangeTypeInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :type, :selection
  end
end

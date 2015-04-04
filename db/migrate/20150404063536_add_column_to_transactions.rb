class AddColumnToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :description, :string
    add_column :transactions, :value, :float
  end
end

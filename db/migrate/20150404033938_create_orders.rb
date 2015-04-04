class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :transaction_id
      t.integer :quantity
      t.string :type
      t.string :address

      t.timestamps null: false
    end
  end
end

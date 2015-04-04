class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.boolean :is_paid

      t.timestamps null: false
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :total_payment
      t.integer :status
      t.integer :payment_method
      t.integer :delivery_fee
      t.string :postal_code
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end

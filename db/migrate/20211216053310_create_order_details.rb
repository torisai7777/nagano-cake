class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :production_status
      t.integer :amount
      t.integer :tax_included_price
      t.timestamps
    end
  end
end

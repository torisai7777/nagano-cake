class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :price
      t.string :image_id
      t.boolean :is_active, null: false, default: true
      t.integer :genre_id
      t.timestamps
    end
  end
end

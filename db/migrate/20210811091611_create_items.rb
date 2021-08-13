class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :state_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :shipping_prefecture_id, null: false
      t.integer :shipping_day_id, null: false
      t.integer :price, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end

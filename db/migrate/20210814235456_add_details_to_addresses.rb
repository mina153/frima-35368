class AddDetailsToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :postal_code, :string
    add_column :addresses, :shipping_prefecture_id, :integer
    add_column :addresses, :city, :string
    add_column :addresses, :house_number, :string
    add_column :addresses, :building_number, :string
    add_column :addresses, :phone_number, :string
    add_reference :addresses, :purchase, null: false, foreign_key: true
  end
end

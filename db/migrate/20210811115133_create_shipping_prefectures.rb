class CreateShippingPrefectures < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_prefectures do |t|

      t.timestamps
    end
  end
end

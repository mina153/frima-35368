class AddFamilyNameReadingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :family_name_reading, :string
  end
end

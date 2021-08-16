class RemoveCreatedAtFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :created_at, :string
  end
end

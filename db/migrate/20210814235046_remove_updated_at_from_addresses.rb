class RemoveUpdatedAtFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :updated_at, :string
  end
end

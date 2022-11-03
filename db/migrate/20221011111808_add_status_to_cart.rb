class AddStatusToCart < ActiveRecord::Migration[7.0]
  def change
   add_column :carts, :status, :boolean , default: true
  end
end

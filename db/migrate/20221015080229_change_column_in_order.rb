class ChangeColumnInOrder < ActiveRecord::Migration[7.0]
  def change
    remove_reference :orders, :product, index: true, foreign_key: true
    add_reference :orders, :cart, index: true
    add_column :orders, :address, :string
    add_column :orders, :contact_no,  :integer
    add_column :orders, :status, :string, :default => 'pending'
  end
end

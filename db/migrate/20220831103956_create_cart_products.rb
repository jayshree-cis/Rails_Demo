class CreateCartProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_products do |t|
      
      t.belongs_to :cart, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.float :total_amount
      
      t.timestamps
    end
  end
end

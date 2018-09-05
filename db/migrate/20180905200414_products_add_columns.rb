class ProductsAddColumns < ActiveRecord::Migration[5.1]
  def up
    add_column :spree_products, :price, :float
  end

  def down
    remove_column :spree_products, :price
  end
end

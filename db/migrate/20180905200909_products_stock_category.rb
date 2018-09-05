class ProductsStockCategory < ActiveRecord::Migration[5.1]
  def up
    add_column :spree_products, :stock_total, :integer
    add_column :spree_products, :category, :string
  end

  def down
    remove_column :spree_products, :stock_total
    remove_column :spree_products, :category
  end
end

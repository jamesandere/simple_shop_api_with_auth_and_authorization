class AddForeignKeyForProducts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :products, :brands
  end
end

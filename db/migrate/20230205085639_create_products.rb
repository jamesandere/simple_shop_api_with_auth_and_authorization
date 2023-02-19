class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.column(:price, :integer)
      t.integer :brand_id

      t.timestamps
    end
  end
end

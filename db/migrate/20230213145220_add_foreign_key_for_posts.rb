class AddForeignKeyForPosts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :posts, :authors
  end
end

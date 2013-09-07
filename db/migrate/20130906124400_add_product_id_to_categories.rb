class AddProductIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :product_id, :integer
  end
end

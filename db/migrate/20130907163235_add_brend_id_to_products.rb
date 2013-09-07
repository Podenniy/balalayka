class AddBrendIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :brend_id, :integer
  end
end

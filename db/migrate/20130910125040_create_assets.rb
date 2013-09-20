class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :product_id

      t.timestamps
    end
     add_index :assets, :product_id
  end
end

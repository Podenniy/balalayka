class CreateBrends < ActiveRecord::Migration
  def change
    create_table :brends do |t|
      t.string :title
      t.text :discription
      t.integer :category_id

      t.timestamps
    end
  end
end

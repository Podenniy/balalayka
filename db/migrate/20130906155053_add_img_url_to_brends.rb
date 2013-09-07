class AddImgUrlToBrends < ActiveRecord::Migration
  def change
    add_column :brends, :image_url, :string
  end
end

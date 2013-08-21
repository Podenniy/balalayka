class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence:true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true, :length => {
  	:minimum => 10,
  	:message => "Должно быть 10 символов"
  }

  #validates :image_url, allow_blank: true, format: {
  	#with: %r{\a(gif|jpg|png)$}i,
  	#message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
  #
end

class Product < ActiveRecord::Base
  belongs_to :brend
  belongs_to :category
  has_many :users
  has_many :line_items
  has_many :orders, through: :line_items
  has_many :assets, :dependent => :destroy

  accepts_nested_attributes_for :assets, :allow_destroy => true

  
  before_destroy :ensure_not_referenced_by_any_line_item
  

  validates :title, :description, :image_url, presence:true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true, :length => {
  	:minimum => 10,
  	:message => "Должно быть 10 символов"
  }

  validates :image_url, allow_blank: true, format: {
  	with: /\A\.(gif|jpg|png)\z/,
  	message: 'URL должен указывать на изображение формата GIF, JPG или PNG.'
  }




   
  private
  # убеждаемся в отсутствии товарной позиций ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      arrors.add(:base, 'существуют товарные позиции')
      return false
    end
  end

  
end

require 'spec_helper'

describe Product do 
  it 'should exists' do
  	Product.new
  end
     category = Category.new()
  it 'should have methtod category && children 'do
    category = Category.new( name: "cat")
    category1 = Category.new( name: "child")
    category1.parent = category

    product = Product.new(price:10000)
    product.category = category

    
    product.category.children

  end
end
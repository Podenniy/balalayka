class Category < ActiveRecord::Base
  has_many :products
  belongs_to :parent, :class_name => "Category" 
  has_many :children,  :class_name => "Category",:foreign_key => "parent_id",:dependent => :destroy
 has_many :brends

  #scope :only_parents,  where(:parent_id => nil)

  #scope :only_childrens, lambda {|category| where(:parent_id => category.id)}


end

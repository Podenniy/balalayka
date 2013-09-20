class Asset < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image,
      :styles => {:small => '64x64#', :medium => '260x310>'},
      :path => " :rails_root/public/system/:attachment/:id/:style/:filename",
      :url =>   "system/:attachment/:id/:style/:filename"
end

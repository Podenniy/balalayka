class AssetsController < ApplicationController

  
   
  def permitted_params
   params.permit(:asset => [:product_id, assets_attributes: [:image]])
  end
end

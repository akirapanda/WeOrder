class ShopsController < ApplicationController

  def show
    @shop = Shop.find(params[:id])
  end
  
  def index
    
  end
  
  def products
    @shop = Shop.find(params[:id])
    product_cates = @shop.product_cates.includes(:products)
    
    @product_cates=[]
    
    product_cates.each do |cate|
      product_cate = {}
      product_cate[:name]=cate.name
      product_cate[:products]=cate.products.reject{|product| product.shop_id != @shop.id}
      @product_cates<<product_cate
    end
  end
  
end
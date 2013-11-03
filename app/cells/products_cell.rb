class ProductsCell < Cell::Rails  
  def user_shopping
    render
  end
  
  def lastest
    @products=Product.where(:public=>true)
    render
  end
  
  
  def who_buy(args)
    products=args[:products]
    @shopping_items=ShoppingItem.where(:products_id=>products.id)
    render
  end
  
  def comments(args)
    @product=args[:products]
    @comments=GoodsComment.where(:products_id=>@product.id)
    @comment=GoodsComment.new

    render
  end
  
  
end

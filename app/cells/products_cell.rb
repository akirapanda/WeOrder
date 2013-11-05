class ProductsCell < Cell::Rails  
  def user_shopping
    render
  end
  
  def all
    @products=Product.where(:is_onsale=>true).where(:public=>true)
    render
  end
  
  def top10
    @products=Product.joins(:shopping_items).select("products.*").group("products.id").order("sum(shopping_items.count) desc").limit(5)
    render
  end
  
  def recommend
    @products=Product.where(:is_onsale=>true).where(:public=>true).where(:is_recommend=>true).limit(3)
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

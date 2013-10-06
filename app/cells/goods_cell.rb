class GoodsCell < Cell::Rails

  def user_shopping
    render
  end
  def lastest
    @goods=Good.all
    render
  end
  
  
  def who_buy(args)
    goods=args[:goods]
    @shopping_items=ShoppingItem.where(:good_id=>goods.id)
    render
  end
  
  def comments(args)
    @good=args[:goods]
    @comments=GoodsComment.where(:good_id=>@good.id)
    @comment=GoodsComment.new

    render
  end
  
  
end

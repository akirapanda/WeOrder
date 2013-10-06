class GoodsCell < Cell::Rails

  def user_shopping
    render
  end
  def lastest
    @goods=Good.all
    render
  end
end

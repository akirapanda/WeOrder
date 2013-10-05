class GoodsCell < Cell::Rails

  def lastest
    @goods=Good.all
    render
  end

end

class ShoppingsCell < Cell::Rails
  def today
    today=Date.strptime Time.now.to_s "%m/%d/%Y"
    @shoppings=Shopping.where("date(created_at)=?",today)
    render
  end
  
  
end

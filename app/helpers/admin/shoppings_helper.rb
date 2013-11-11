module Admin::ShoppingsHelper
  def fields_for_shopping_item(shopping_item, &block)
    prefix = shopping_item.new_record? ? 'new' : 'exist'
    fields_for("shopping[#{prefix}_shopping_item_attributes][]", shopping_item, &block)
  end
  
  def tag_process_field(shopping)
    if(shopping.status=="新订单")
      link_to to_process_admin_shopping_path(shopping) ,:class=>'btn btn-success' do
        "进行处理"
      end
    elsif (shopping.status=="处理中")
      link_to to_complete_admin_shopping_path(shopping) ,:class=>'btn btn-success' do
        "标记完成"
      end
    end
    
  end
end

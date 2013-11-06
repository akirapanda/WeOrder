module Admin::ShoppingsHelper
  def fields_for_shopping_item(shopping_item, &block)
    prefix = shopping_item.new_record? ? 'new' : 'existing'
    fields_for("shopping[#{prefix}_shopping_item_attributes][]", shopping_item, &block)
  end
end

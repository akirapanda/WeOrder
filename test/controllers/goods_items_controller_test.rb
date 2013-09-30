require 'test_helper'

class GoodsItemsControllerTest < ActionController::TestCase
  setup do
    @goods_item = goods_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goods_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goods_item" do
    assert_difference('GoodsItem.count') do
      post :create, goods_item: { good_id: @goods_item.good_id, order_id: @goods_item.order_id }
    end

    assert_redirected_to goods_item_path(assigns(:goods_item))
  end

  test "should show goods_item" do
    get :show, id: @goods_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goods_item
    assert_response :success
  end

  test "should update goods_item" do
    patch :update, id: @goods_item, goods_item: { good_id: @goods_item.good_id, order_id: @goods_item.order_id }
    assert_redirected_to goods_item_path(assigns(:goods_item))
  end

  test "should destroy goods_item" do
    assert_difference('GoodsItem.count', -1) do
      delete :destroy, id: @goods_item
    end

    assert_redirected_to goods_items_path
  end
end

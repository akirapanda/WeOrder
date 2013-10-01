require 'test_helper'

class ShoppingItemsControllerTest < ActionController::TestCase
  setup do
    @shopping_item = shopping_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shopping_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopping_item" do
    assert_difference('ShoppingItem.count') do
      post :create, shopping_item: { amount: @shopping_item.amount, count: @shopping_item.count, good_id: @shopping_item.good_id, shopping_id: @shopping_item.shopping_id }
    end

    assert_redirected_to shopping_item_path(assigns(:shopping_item))
  end

  test "should show shopping_item" do
    get :show, id: @shopping_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopping_item
    assert_response :success
  end

  test "should update shopping_item" do
    patch :update, id: @shopping_item, shopping_item: { amount: @shopping_item.amount, count: @shopping_item.count, good_id: @shopping_item.good_id, shopping_id: @shopping_item.shopping_id }
    assert_redirected_to shopping_item_path(assigns(:shopping_item))
  end

  test "should destroy shopping_item" do
    assert_difference('ShoppingItem.count', -1) do
      delete :destroy, id: @shopping_item
    end

    assert_redirected_to shopping_items_path
  end
end

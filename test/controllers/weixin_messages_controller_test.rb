require 'test_helper'

class WeixinMessagesControllerTest < ActionController::TestCase
  setup do
    @weixin_message = weixin_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weixin_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weixin_message" do
    assert_difference('WeixinMessage.count') do
      post :create, weixin_message: { from_user: @weixin_message.from_user, msg: @weixin_message.msg, msgType: @weixin_message.msgType }
    end

    assert_redirected_to weixin_message_path(assigns(:weixin_message))
  end

  test "should show weixin_message" do
    get :show, id: @weixin_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weixin_message
    assert_response :success
  end

  test "should update weixin_message" do
    patch :update, id: @weixin_message, weixin_message: { from_user: @weixin_message.from_user, msg: @weixin_message.msg, msgType: @weixin_message.msgType }
    assert_redirected_to weixin_message_path(assigns(:weixin_message))
  end

  test "should destroy weixin_message" do
    assert_difference('WeixinMessage.count', -1) do
      delete :destroy, id: @weixin_message
    end

    assert_redirected_to weixin_messages_path
  end
end

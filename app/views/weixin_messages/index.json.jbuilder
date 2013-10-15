json.array!(@weixin_messages) do |weixin_message|
  json.extract! weixin_message, :from_user, :msgType, :msg
  json.url weixin_message_url(weixin_message, format: :json)
end

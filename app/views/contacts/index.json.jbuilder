json.array!(@contacts) do |contact|
  json.extract! contact, :user_id, :province, :city, :district, :address, :zipcode, :home_phone, :mobile_phone, :name
  json.url contact_url(contact, format: :json)
end

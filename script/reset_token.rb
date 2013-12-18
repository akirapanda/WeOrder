User.transaction do
  users=User.all
  users.each do |user|
    user.reset_authentication_token
    user.save
  end
end
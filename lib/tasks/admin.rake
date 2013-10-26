namespace :admin do
  desc "TODO"
  task sendmail: :environment do
require 'mail'

Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.gmail.com',
    :port => '587',
    :user_name => 'p.chenliang@gmail.com',
    :password => 'Xiaoke1021',
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end
mails=SendMail.where(:done=>false)
puts "#{Time.now} there is #{mails.size} need to be sent"
mails.each do |mail|
  Mail.deliver do
    from    'admin@nosweetnopay.com'
    to      '525483886@qq.com'
    subject 'new shopping order'
    body  mail.content 
  end
mail.done=true
mail.save
end
  end


end

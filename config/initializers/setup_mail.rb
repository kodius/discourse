ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :address        => 'email-smtp.eu-west-1.amazonaws.com',
  :port           => 587,
  :domain         => 'online-excel-solutions.com',
  :user_name      => ENV["SMTP_USERNAME"],
  :password       => ENV["SMTP_PASSWORD"],
  :authentication => :login
}
ActionMailer::Base.default_url_options = { :host => 'online-excel-solutions.com', :protocol => 'https'  }

class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'receipt_email'
end

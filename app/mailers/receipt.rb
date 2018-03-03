class Receipt < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(current_user, order)
    @user = current_user
    @order = order
    if current_user
      mail(to: @user.email, subject: "Thank you for order ##{@order.id}!")
    else
      mail(to: "generic@fakeeemail.com", subject: "Thank you for order ##{@order.id}!")
    end
  end
end

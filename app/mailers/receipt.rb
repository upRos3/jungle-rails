class Receipt < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email(current_user, order)
    if current_user
    @user = current_user
    @order = order
      mail(to: @user.email, subject: "Thank you for order ##{@order.id}!")
    end
  end
end

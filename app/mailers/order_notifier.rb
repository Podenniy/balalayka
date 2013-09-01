class OrderNotifier < ActionMailer::Base
  default from: 'Instrument <balalayka@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order


    mail to: order.email, subject: 'Подтверждение закакза в Balalayka'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
   @order = order

    mail to: order.email, subject: 'Заказ из Balalayka magazine отправлен'
  end
end

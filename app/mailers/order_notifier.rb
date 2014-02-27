class OrderNotifier < ActionMailer::Base
  skip_before_filter :authorize, only: [:received, :recibido]
  default from: "cesar.conopoima@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    @mailer = order
    mail to: order.email, subject: 'Confirmacion de pedido'
  end

  def recibido(order)
    @order = order
    @mailer = order
    mail :to => "cesar.conopoima@gmail.com", subject: 'Hemos recibido un pedido'
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

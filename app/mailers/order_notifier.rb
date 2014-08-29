class OrderNotifier < ActionMailer::Base
  default from: "copelancitadevenezuela@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order,precio_total)
    @order = order
    @precio_total = precio_total
    @mailer = order
    mail to: order.email, subject: 'Confirmacion de pedido'
  end

  def recibido(order,precio_total)
    @order = order
    @precio_total = precio_total
    @mailer = order
    mail :to => "copelancitadevenezuela@gmail.com", subject: 'Hemos recibido un pedido'
    mail :to => "ventas@copelancitadevenezuela.com", subject: 'Hemos recibido un pedido'
    mail :to => "copelancitadevenezuela@cantv.net", subject: 'Hemos recibido un pedido'
  end
  def statuschanged(order)
    @order = order
    @status = order.status
    @useremail = order.email
    mail to: order.email, subject: 'Cambio de estatus de su compra'
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
end

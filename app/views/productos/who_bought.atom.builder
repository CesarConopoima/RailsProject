atom_feed do |feed|
  feed.title "Quien Compro #{@producto.nombre}"
  latest_order = @producto.orders.sort_by(&:updated_at).last
  
  feed.updated( latest_order && latest_order.updated_at )
  @producto.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
	  
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Enviado a #{order.direccion}"
		
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Producto'
            xhtml.th 'Cantidad'
            xhtml.th 'Precio Total'
          end
		  
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.producto.nombre
              xhtml.td item.quantity
              xhtml.td number_to_currency item.total_price
            end
          end
		  
          xhtml.tr do
            xhtml.th 'total', colspan: 2
            xhtml.th number_to_currency \
              order.line_items.map(&:total_price).sum
          end
        end
		
        xhtml.p "Pagado por #{order.tipoPago}"
      end
      entry.author do |author|
        author.nombre order.nombre
        author.email order.email
      end
    end
  end
end
class Printer
  def put(destination_path, orders)
    @orders = orders
    @file = File.new(destination_path, "w")
    
    put_orders_list
    put_sales_tax
    put_total_price

    @file.close
  end

  private

  def put_orders_list
    order_list = @orders.list.map do |order|
      "#{order.qtd} #{order.title}: #{order.price_with_tax}"
    end

    @file.puts(order_list)
  end

  def put_sales_tax
    @file.puts("Sales Taxes: #{@orders.total_taxes}")
  end

  def put_total_price
    @file.puts("Total: #{@orders.total_price_with_taxes}")
  end
end
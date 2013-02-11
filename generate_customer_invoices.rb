# The ar.rb file loads all of our ActiveRecord Object and
# establishes our database connection.
load 'ar.rb'

def currency amount
  sprintf("$%.2f",amount)
end

customers_with_orders = Customer.includes('orders').where('orders.id IS NOT NULL').where('orders.status = "new"')


customers_with_orders.each do |customer|

  customer.orders.each do |new_order|

  #show customer name and address
    puts "Invoice for #{customer.first_name} #{customer.last_name}"
    puts "#{customer.address}"
    puts "#{customer.city} , #{customer.province.name}"

    puts""

    sub_total=0
    new_order.line_items.each do |line_item|

      item_name=   line_item.product.name
      item_price=  line_item.price
      item_quantity = line_item.quantity
      item_total=   item_quantity*item_price
      #show name, quantity, price and calulated total for this item
      puts "#{item_name} #{'.'*(35-item_name.length) } #{item_quantity} x #{currency(item_price)} = #{currency(item_total)}"
      sub_total+=item_total #add to sub total
    end

    pst= (sub_total*new_order.pst_rate).round(2)
    gst=(sub_total*new_order.gst_rate).round(2)
    hst=(sub_total*new_order.hst_rate).round(2)
    grand_total=sub_total+pst+gst+hst

    # #show total result
    puts ""
    puts "Sub Total     :  #{currency(sub_total)}"

    puts "PST (#{new_order.pst_rate.round(2)*100}%)    :  #{currency(pst)}" unless pst.zero?
    puts "GST (#{new_order.gst_rate.round(2)*100}%)    :  #{currency(gst)}" unless gst.zero?
    puts "HST (#{new_order.hst_rate.round(2)*100}%)   :  #{currency(hst)}" unless hst.zero?

    puts "Grand Total   :  #{currency(grand_total)}"
    puts "\n"

  end
end
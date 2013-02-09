# The ar.rb file loads all of our ActiveRecord Object and
# establishes our database connection.
load 'ar.rb'


# Create and persist orders for three customers. (Each customer should be from a different province.)
c1=Customer.where(:province_id => 1)[0]
puts c1.province.gst
puts c1.province.pst
new_order=c1.orders.build
new_order.status="new"


# Each order should involve at least four line items. (Use different products for each customer.)
product_array=Product.limit(12).to_a
puts product_array[0].inspect



# Ensure that you set the status of all orders to ‘new’
# Ensure that you backup the pst, gst and hst rates from the customer’s province into the appropriate properties of the order.
new_order.gst_rate = c1.province.gst
new_order.pst_rate= c1.province.pst
puts new_order.inspect

new_order.save



4.times do
product_index=rand(0..product_array.count)
	new_lineitem=new_order.line_items.build
new_lineitem.quantity=rand(1..15)
product_index=rand(product_array.size)


current_product=product_array[product_index]
puts current_product.price
new_lineitem.product = current_product
new_lineitem.price=current_product.price
product_array.delete_at(product_index)
#product_array.delete_at(2)
puts new_lineitem.inspect
new_lineitem.save
end
puts product_array.count
# Ensure that each order actually belongs to a customer by way of its foreign key.
# Ensure that each line item has a set quantity.
# Ensure that each line item is associated with a specific product by way of its foreign key.
# Ensure that each line item is associated with an order by way of its foreign key.
# Ensure that a backup of the associated product price is saved in each line item.
# Once you’ve done the above, pick one of the customers who already has an order and make them a second order.


#c=Customer.where(:province_id => 1)[0]
 #puts c.first_namea
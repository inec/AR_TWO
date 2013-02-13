# The ar.rb file loads all of our ActiveRecord Object and
# establishes our database connection.
load 'ar.rb'


# Create and persist orders for three customers. (Each customer should be from a different province.)
three_customers=[]
1..3 do |province_id|
c1=Customer.where(:province_id => 1).first
c2=Customer.where(:province_id => 2).first



# Each order should involve at least four line items. (Use different products for each customer.)
product_array=Product.limit(20).to_a
puts product_array[0].inspect
# Ensure that each order actually belongs to a customer by way of its foreign key.

new_order=c1.orders.build
# Ensure that you set the status of all orders to ‘new’
new_order.status="new"


# Ensure that you backup the pst, gst and hst rates from the customer’s province into the appropriate properties of the order.
new_order.gst_rate = c1.province.gst
new_order.pst_rate= c1.province.pst
new_order.hst_rate=c1.province.hst
puts new_order.inspect

new_order.save


#Each order should involve at least four line items.
4.times do
  product_index=rand(0..product_array.count)
  # Ensure that each line item is associated with an order by way of its foreign key.
  new_lineitem=new_order.line_items.build
  # Ensure that each line item has a set quantity.
  new_lineitem.quantity=rand(1..20)
  product_index=rand(product_array.size)

  
  current_product=product_array[product_index]
  # Ensure that each line item is associated with a specific product by way of its foreign key.
  new_lineitem.product = current_product
  # Ensure that a backup of the associated product price is saved in each line item.
  new_lineitem.price=current_product.price
  product_array.delete_at(product_index)

  #puts new_lineitem.inspect
  new_lineitem.save
end







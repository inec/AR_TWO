# The ar.rb file loads all of our ActiveRecord Object and
# establishes our database connection.
load 'ar.rb'

# Create and persist orders for three customers. (Each customer should be from a different province.)
customers_queue=[]

#province id 1 for Alberta, 2 for B.C. , 3 for Manitoba as example here ,pick three customer for each provinces

(1..3).each do |province_id|
  customers_queue<<Customer.where(:province_id => province_id).last
end

# add one random existed customer in queue for second order
customers_queue<<customers_queue[rand(0..customers_queue.size)]

# Each order should involve at least four line items. (Use different products for each customer.)
product_array=Product.limit(20).to_a

#add order for each one(cust) in customers queue
customers_queue.each do |customer|
  new_order=customer.orders.build
  # Ensure that you set the status of all orders to ‘new’
  new_order.status="new"

  # Ensure that you backup the pst, gst and hst rates from the customer’s province into the appropriate properties of the order.
  new_order.gst_rate = customer.province.gst
  new_order.pst_rate= customer.province.pst
  new_order.hst_rate=customer.province.hst


  #save the order to database
  new_order.save

  #Each order should involve at least four line items by random selection.
  4.times do
    
    # Ensure that each line item is associated with an order by way of its foreign key.
    new_lineitem=new_order.line_items.build

    # Ensure that each line item has a set quantity by random from 1 to 20.
    new_lineitem.quantity=rand(1..20)
    
    #get one product randomly
    product_index=rand(product_array.size)

    current_product=product_array[product_index]

    # Ensure that each line item is associated with a specific product by way of its foreign key.
    new_lineitem.product = current_product

    # Ensure that a backup of the associated product price is saved in each line item.
    new_lineitem.price=current_product.price

    #remove the product to prevent be taken for 2nd time
    product_array.delete_at(product_index)

    #save to database
    new_lineitem.save
  end #end of add line item for the order

end #end of add order loop
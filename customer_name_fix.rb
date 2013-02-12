load 'ar.rb'

#get all customer whose last is nil
customers_name_nil = Customer.where(:last_name=>nil).limit(3)


#loop these customers ,split and save the correct first name and last Name
customers_name_nil.each do |customer|
  name_array=customer.first_name.split(' ',2)
  customer.first_name=name_array[0]
  customer.last_name=name_array[1]
  customer.save
  #puts customer.inspect
end





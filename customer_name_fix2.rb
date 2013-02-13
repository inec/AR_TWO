load 'ar.rb'

#get all customer whose last is nil
customers_name_nil = Customer.where(:last_name=>nil)


#loop these customers ,split and save the correct first name and last Name
customers_name_nil.each do |c|
  name_array=c.first_name.split(' ',2)
  c.first_name=name_array[0]
  c.last_name=name_array[1]
  c.save
end


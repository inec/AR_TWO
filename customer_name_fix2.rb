load 'ar.rb'

customers_name_nil = Customer.where(:last_name=>nil)
puts customers_name_nil.count


customers_name_nil.each do |c|
  name_array=c.first_name.split(' ',2)
  c.first_name=name_array[0]
  c.last_name=name_array[1]
  c.save
end


require 'date'
a="puts Time.new"
arr=[]
20.times do 
year=rand(1999..2013).to_s
month=rand(1..12).to_s
day=rand(1..28).to_s
date_string="#{year}-#{month}-#{day}"
#puts date_string
#puts Date.parse(date_string)
#puts Date.parse(ran
arr<<Date.parse(date_string)
end

puts arr[2]
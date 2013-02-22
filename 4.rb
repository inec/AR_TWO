class Shape
 attr_accessor:x,:y
	def initialize(x,y)
	@x=x
	@y=y
	end

	def to_s
		puts "This abstract shape is located at x=#{@x} and y=#{@y}"
	end
end

ab=Shape.new(2,2)
puts ab.to_s

class Rectangle < Shape
def initialize(x,y)
  super(x,y)

end
def to_s
 puts "This rectangle is located a x=#{@x} and y=#{@y} and has an area of #{x*y}"
end
end
rec=Rectangle.new(3,4)
puts rec.to_s


backwards_strings = ['.htron eht sdrawot decaf roolf dnuorg eht no moor suomrone ehT',
                      ',senap eht dnoyeb remmus eht lla rof dloC',
                      ',flesti moor eht fo taeh laciport eht lla rof',
                      ',swodniw eht hguorht deralg thgil niht hsrah a',
                      ',erugif yal depard emos gnikees ylirgnuh',
                      ',hself-esoog cimedaca fo epahs dillap emos',
                      '.yrotarobal a fo nialecrop gninihs ylkaelb dna lekcin dna ssalg eht ylno gnidnif tub',
                      '.ssenirtniw ot dednopser ssenirtniW',
                      ',etihw erew srekrow eht fo sllarevo ehT',
                      '.rebbur deruoloc-esproc elap a htiw devolg sdnah rieht',
                      '.tsohg a ,daed ,nezorf saw thgil ehT']

string_count=0

backwards_strings.each do |line|
  string_count+=line.size
  puts line.reverse

end
puts ""
puts "string count is #{string_count}"
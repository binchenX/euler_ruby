#!/usr/bin/ruby
#

def has_repeat_digit? i
 
return true if i.to_s.split("").uniq.size < i.to_s.size
return false

end

def mulitply_of v
 (1..500).to_a.map {|x| x * v}.reject {|x| x > 1000}.reject {|x| has_repeat_digit? x}
end

#puts mulitply_of(17).inspect
#puts mulitply_of(13).inspect
#puts mulitply_of(11).inspect


def comb a , m, b ,n

	raise ArgumentError if m != 3
	as = "%0#{m}d" % a 
	bs = "%0#{n}d" % b
	r = if (as[1..2] == bs[0..1])
			(as[0..0]+bs).to_i
		else
			#not a valid combination
			nil
		end
#	puts "#{as} ,#{bs} => #{r}"
end

#puts comb 123,3 ,234 , 3
#puts comb 23,3,2378,4
#puts comb 23,3,678,4


def combination a,m,b,n 
	t =  a.map {|x| b.map {|y| comb(x,m,y,n)}}.flatten.compact.reject{|i| has_repeat_digit? i }
end


r = combination(mulitply_of(13) , 3, mulitply_of(17), 3 )
r = combination(mulitply_of(11),3, r, 4)
r = combination(mulitply_of(7), 3, r, 5)
r = combination(mulitply_of(5), 3, r, 6)
r = combination(mulitply_of(3), 3, r, 7)
r = combination(mulitply_of(2), 3, r, 8)
#puts r.inject(0) {|sum ,x| sum +=x }
r =  r.reject {|x| has_repeat_digit? x or x.to_s.size < 9 }.map do |x|
	(((0..9).to_a - x.to_s.split(""))[0].to_s + x.to_s ).to_i
end
puts r.inject(0) {|sum ,x| sum +=x }

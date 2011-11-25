#!/usr/bin/ruby
#


#Euler 97
def e97
v=2
7830456.times  { v = (v*2) % (10**10) }
puts v
puts (v * 28433 + 1) % (10 ** 10)
end



def isPrime a
   return false if a < 2
   return true if a == 3 or a == 2  
   r = (2..a**(0.5)).any? {|i| a % i == 0 }
   not r
end


def truncatable_prime n

	#if any of the digital contains 0,1,4,6,8 it is not a truncatable_prime
	return true if n == 23
	r = n.to_s.split("").map {|i| i.to_i}.any?  {|i| i % 2 == 0 }
	return false if r == true
	#check all trancted value
	t = []
	e = n.to_s.size - 1
	t = (0..e).inject(t) {|acc,i| acc << n.to_s.slice(i..e).to_i}
	t = (0..e).inject(t) {|acc,i| acc << n.to_s.slice(0..i).to_i}

	t.all? {|i| isPrime(i)}

end


def e37


i = 11
c = 0
a=[] 
while c < 11 do
 	if truncatable_prime i
		puts "find #{c} : #{i}"
		a << i 
		c += 1
	end 
	i += 1 
end
	#get the sum
	puts a.inspect
	puts a.inject(0)  {|acc,i| acc += i}
end


#e37
#puts truncatable_prime 739398
#
def  pandigital n 

	mask = n.to_s.split("").map {|t| t.to_i}.inject(0)  {|acc, i| acc |= 1 << i }
	mask = mask >> 1
	if "1" * n.to_s.length == mask.to_s(2) then return true else return false end

end

def e41
#Any 8 /9 pandigital number can be divide by 3
#as 1+2+3+..+8 = 36 , so it is dividable by 3
#as 1+2+3+..+8 +9 = 45 , so it is dividable by 3
7654321.downto(1000) do |i|

	if pandigital i and isPrime i 
		puts i 
		break
	end
end

end

e41

#!/usr/bin/ruby


def q1
r = []
(1...1000).each {|t| r << t if t % 3 == 0 or t % 5 == 0}
puts r.inject(0) {|sum, a| sum += a}
end


#$fb={}
def fb i
	return 1 if i == 1
	return 2 if i == 2
	return fb(i-1) + fb(i-2)
end

def q2
	#the performance sucks because of recrusive of fb()
	#get fib
	fbs = []
    i = 1	
	while fb(i)< 4_000_000 do fbs << fb(i); i += 1 end
	fbs.reject! {|t| t % 2 != 0}
	puts fbs.inject(0) {|sum ,i| sum += i}
end


#q25 start *************************************
def h  r , c
	return 1 if $h[r].nil? or $h[r][c].nil?  
	return $h[r][c]
end

def left r, c 
	[h(r,c), h(r,c+1 ), h(r,c+2),h(r,c + 3)]	
end

def down r, c 
	[h(r,c), h(r +1,c ), h(r +2,c),h(r+3,c)]	
end

def left_down r, c 
	[h(r,c), h(r + 1,c+1 ), h(r+2,c+2),h(r+3,c + 3)]	
end

def right_down r, c 
	[h(r,c), h(r+1,c-1 ), h(r+2,c-2),h(r+3,c-3)]	
end

class Array
	#multiply all element
	def m
		self.inject(1)  {|p,it| p *= it}
	end
end
def q25
	#load matrix build a 2D matrix
	$h=[]
	i=0
	File.open("q25","r").each {|line| $h[i]=line.split(' ').map {|it| it.to_i};  i += 1  }
	max = 0
	#iterate through all the cell in the matrix
	0.upto($h.size - 1) do |r|
		0.upto($h[r].size - 1) do |c|
			max = [max, left(r,c).m , down(r,c).m , left_down(r,c).m ,right_down(r,c).m].max  
		end
	end	
	puts max

end



#q25 end *************************************


def q9
	
a = (1..334).each do |a|
	b = (a..667).each do |b|
		if a**2 + b**2  - (1000 -a -b)**2 == 0
			puts "find it : a = #{a } , b = #{b} , c = #{1000 - a - b}" ;
			puts "abc = #{a*b*(1000 -a - b)}"
			return; 
		end 
	end
#b > a and b < 667 
end
end

#q15..................................

def m! n
	return 1 if n == 0
	return n * m!(n-1)

end

def q15_2
	# (2n)!/2 * n!
	i = 20 
	puts (m!(i*2))/( (m!(i))**2)

end

#q17.....................................

def bai n
	if n%100 == 0 
		ge(n/100) + " " + "hundred" 
	else
		ge(n/100) + " " + "hundred and " + shi(n.to_s.slice(1..2).to_i)
	end
end

def shi n

return ge(n) if n < 10

special={
		10=>"ten",
		11=>"eleven",
		12=>"twelve",
		13=>"thirteen",
		14=>"fourteen",
		15=>"fifteen",
		16=>"sixteen",
		17=>"seventeen",
		18=>"eighteen",
		19=>"nineteen",
		20=>"twenty",
		30=>"thirty",
		40=>"forty",
		50=>"fifty",
		60=>"sixty",
		70=>"seventy",
		80=>"eighty",
		90=>"ninety",
}

return special[n] if special.key?(n)
#pure shi + ge wei shu
shi(n /10 * 10)  + " " + ge(n - n / 10 * 10)

end

def ge n
{
	0 => "zero???",
	1 => "one",
	2 => "two",	
	3 => "three",	
	4 => "four"	,
	5 => "five"	,
	6 => "six"	,
	7 => "seven",	
	8 => "eight",	
	9 => "nine"	
}[n]

	
	
end

def translate n

    case n
	when 1..9 then ge(n)
	when 10..99 then  shi(n)
	when 100..999 then  bai(n)
	when 1000 then puts "4"
	else "not expected"
	end

end


def q17
	s = "one thousand".gsub(" ",'').size
	1.upto(999) {|t|  s += translate(t).gsub(" ",'').size}
	puts s
end


#q20*************************************************************************************
class Fixnum 
	def fact
		return 1 if self ==0 or self == 1
		(2..self).inject(1) {|p,i| p *=i}
	end
end

def q20
puts 100.fact.to_s.bytes.to_a.map {|t| t-48}.inject(0) {|s,t| s+= t}
puts 100.fact.to_s.split('').inject(0) {|s,t| s+= t.to_i}

end

#q18..........................................
#


def q20
puts 100.fact.to_s.bytes.to_a.map {|t| t-48}.inject(0) {|s,t| s+= t}
puts 100.fact.to_s.split('').inject(0) {|s,t| s+= t.to_i}

end

#q18..........................................
#
#
tri4 = <<TRI
3
7 5
2 4 6
8 5 9 3

TRI

tri20 = <<TRI
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
TRI

def q20_q64
file = File.open("q64","r")
tri = file.read
#for q64
#build a 2D array from TRI
h=[]
tri.split("\n").each_with_index do |row ,index|
	h[index] = row.split().map  {|t| t.to_i}
end
#p h
#max is 2D ,storing max value to that node
node_max=[[h[0][0]]]
#loop from the second row (index 1)to last row
h.each_with_index do |row ,r_idx|
	next if r_idx == 0
	#init to []
	node_max[r_idx] = []
	row.each_with_index do  |i, idx|
		#bug here , node_max[x].fetch(-1,0) will get node_max[x].last , not 0 
		node_max[r_idx] <<  i + [ node_max[r_idx - 1].fetch(idx -1,0), node_max[r_idx -1].fetch(idx,0)].max
	end
end
puts node_max.last.max
end



require 'mathn'
def q10   #tooo slow
prime = Prime.new
s= 0
while (p = prime.next) < 2_000_000
	s += p
end

p s
end


#q22-------------------------
class String
	#only apply for a....z
	def alpha_value
		s = 0
		#65 is the ASICC for 'A'
		self.each_byte  {|t| s += (t-64)}
		s
	end
end
def q22
	names = File.open("q20","r").read.gsub("\"",'').split(',')
	all = 0
	names.sort!.each_with_index do  |name,index|
#			puts "name #{name} ,value = #{name.alpha_value}"
			all += name.alpha_value * (index + 1)
	end

	puts all	

end

#q28
def q28

	h=[1]
	(3..1001).step(2) do |i|
		#
		start = h.last
		h << start + i - 1
		h << start + 2 * (i-1)
		h << start + 3 * (i-1) 
		h << start + 4 * (i-1) 
	end
	p h.inject(0) {|s,t| s+=t}
end


#q34...
#This solution is very very slow....
#puts 9.fact * 7 - 10**7
#
$h_fact_sum = {}
def fact_sum val
	key = val.sort.to_s
	return $h_fact_sum[key] if $h_fact_sum.key?(key)
	$h_fact_sum[key] = val.inject(0)  {|s,t| s += t.fact}	
end

def  q34
s = 0
3.upto(10**7) do |i|
	ppp =  fact_sum(i.to_s.split('').map {|t| t.to_i})
	if i == ppp
		s += i
	end
end
puts s
end

#puts 10.fact
#q24========================
def q24_item  nitem ,nth 
remain = nth
h=[]
1.upto(nitem) do |i|
	choices = (nitem-i).fact
	if (remain % choices).zero?
		#It is the key point!!!!
		h << (remain / choices) - 1
	else
		h <<  (remain.to_f / (choices)).to_i
	end
	remain = remain - h.last * choices	
end
#p h
#process
items = []
(0..nitem-1).each {|t| items << t}
coef = [] 
h.each do |it|
	coef << items[it]
	items.delete_at(it)	
end

coef.to_s
end

#p q24_item 10, 1_000_000


#q42============================
def q42
	names = File.open("q42","r").read.gsub("\"",'').split(',')
	#build a triangle number hash , upper bould is 10*26 = 260
	tri_hash={}
	1.upto(40)  {|i|  tri_hash[i*(i+1)>>1]=1}
	#p tri_hash
	s = 0 
	names.each {|t| s += 1 if tri_hash.key?(t.alpha_value)}
	puts s
end

#q32===================
=begin
#it can only be in two formats 
# xx * yyy = zzzz  Or
# x * yyyy = zzzz
#
# The common algorithm used in this solution :
# 1. remove duplicted item in array
# 2. the size of the array
# 3. contrat two array
# 4. delete a specific value in the array
#
#
# The way determine whether it is pandigital can be done as follows :
#
# unsigned GetPandigitalMask(unsigned u)
{
  unsigned rdig;
  unsigned mask = 0;
  do
  {
    rdig = u%10;
    mask |= (1 << (rdig-1));
    u = u/10;
  }
  while(u);
  return mask;
}

for a * b = c 
if 0x1FF = GetPandigitalMask(a) | GetPandigitalMask(b) | GetPandigitalMask(p)
It is pandigital number!!!!

It is very efficient and straight forward!
=end
 
def q32
	h = []
# xx * yyy = zzzz  Or
	12.upto(98)  do |x|
		123.upto(987)  do |y|
		p = x * y
		next if  p > 10000			
		a =	x.to_s.split('') + y.to_s.split('') + p.to_s.split('')
		# "0" is not allowed	
		a.delete("0")
	    if a.uniq.size.eql?(9)
				h << x*y 
				puts "#{x} * #{y} = #{x *y}"
		end
		end
	end
# x * yyyy = zzzz
	1.upto(9) do |x|
		1234.upto(9876) do |y|
			p = x * y 
			next if p > 10000
		
			a =	x.to_s.split('') + y.to_s.split('') + p.to_s.split('')
			# "0" is not allowed	
			a.delete("0")
	    	if a.uniq.size.eql?(9)
					h << x*y 
					puts "#{x} * #{y} = #{x *y}"
			end
		end
	end
	puts h.uniq.inject(0)  {|s,t| s +=t}
end

#q53============================

def q53
#Cnr
# 23 ,10 ~ 23 ,11
# 24 ,xx   24 ,12
# 25 ,xx   25 ,12
	all = 0
	23.upto(100) do  |n|
		1.upto( n.div(2))  do |r|
					if n.fact.div(r.fact * (n-r).fact) > 1_000_000
						all += (r..n-r).inject(0)  {|s,t| s+=1}
						puts "n:#{n} r:#{(r..n-r)}"
						break
					end
		end
	end

	puts all

end


#q54........
#
#
#


$m = {
"1"=>1,
"2"=>2,
"3"=>3,
"4"=>4,
"5"=>5,
"6"=>6,
"7"=>7,
"8"=>8,
"9"=>9,
"T"=>10,
"J"=>11,
"Q"=>12,
"K"=>13,
"A"=>14,
}

def shunzi? x
	return false if  !x.uniq.size.eql?(5)
	
	#ok. we have 5 uniq element 	
	sx = x.sort
	if (sx.last - sx.first) == (sx.size - 1) 
		 return true
    else 
		return false
	end
end


def hash_pair a 
	p a.inspect
	h={}
	a.each do |v|
		if h.key?(v) then h[v]+=1 else h[v]=1 end
	end	
	p h.inspect
	h
end

$rank_v = {
"dan ge" => 1,
"1 pair" => 2,
"2 pair" => 3,
"3 ge tou" => 4,
"shun zi" =>5,
"tong hua" =>6,
"3+2" => 7,
"4+1" => 8,
"tong hua shun" =>9,
#"zui da de tong hua shun" => 10, 
}
def rank x 

=begin

		if flush (tong hua) 
			then straight flush? (tong hua shun)
		else if 4 +1
		else if 3 +2
		else if shun zi?
		else if 3
		else if 2 pair
		else if 1 pair
		else if dan ge
=end
	hua_se = x.map{|t| t.slice(1).chr}
	shu_zi = x.map{|t| $m[t.slice(0).chr]}
	p shu_zi
    if hua_se.uniq.size.eql?(1)
		if  shunzi?(shu_zi) 	
			puts "tong hua shun"
			return $rank_v["tong hua shun"] 
		else
			return $rank_v["tong hua"]
		end
	else
		return $rank_v["shun zi"] if shunzi?(shu_zi)
		#If we got here , hua_se does not matter any more
		#build hash.. ( value => tims) , the times determines the Rank
		hp = hash_pair(shu_zi)
		return $rank_v["4+1"]if hp.has_value?(4)
		return $rank_v["3+2"]if hp.has_value?(3) and hp.has_value?(2)
		return $rank_v["3 ge tou"]if hp.has_value?(3) and !hp.has_value?(2)
		return $rank_v["2 pair"]if hp.has_value?(2) and hp.values.size.eql?(3)#2,2,1 case
		return $rank_v["1 pair"]if hp.has_value?(2) and hp.values.size.eql?(4)#2,1,1,1 case
		return $rank_v["dan ge"]if hp.values.size.eql?(5)#1,1,1,1,1 case
	end
end


def shu_zi x
	x.map {|t| $m[t.slice(0).chr]} 	
end


def array_comp a , b 

	a.each_with_index do |t, i|

		return "LG"	if t > b[i] 
		return "ST" if t < b[i] 

	end
	#if comes here ... means error
	"EQ"
end


def compare a ,b 

=begin
	for eich hand , 
		1.determine the Rank
		2.if belong to the same Major level ,than go to Minor level
=end
	rank_a ,rank_b = rank(a) ,rank(b)
	puts "rank A #{$rank_v.index(rank_a)}"
	puts "rank B #{$rank_v.index(rank_b)}"
	return	"a>b" if rank_a > rank_b	
	return	"a<b" if rank_b > rank_a	

	puts "Equal Rank... let's see more"
	#when rank_a == rank_b
	if rank_a == $rank_v["tong hua shun"] or rank_a == $rank_v["tong hua"] or 
	   rank_a == $rank_v["shun zi"] or rank_a == $rank_v["dan ge"]
		max_a = shu_zi(a).sort.last 	
		max_b = shu_zi(b).sort.last 	
		if max_a > max_b then return "a>b"  else return "a<b" end
	else
	 	#compare the value sorted by times 	
	 	h_a=[]
		p hp_a = hash_pair(shu_zi(a))
		p hp_b = hash_pair(shu_zi(b))
		p hp_a.inspect
		p hp_b.inspect
	 	hp_a.values.sort {|x,y| y<=>x }.each { |v| h_a << hp_a.index(v) }
		h_b=[]
	 	hp_b.values.sort {|x,y| y<=>x }.each { |v| h_b << hp_b.index(v) }
	
		p h_a.inspect
		p h_b.inspect
		return "a>b"	if array_comp(h_a ,h_b).eql?("LG")  
		return "a<b"	if array_comp(h_a ,h_b).eql?("ST") 
		
	end
	
	"a>b"
end


def q54

f = File.open("q54","r")
sum = 0
f.each do |line|
	a  = line.split.slice(0..4)
	b  = line.split.slice(5..9)
	if compare(a,b).eql?("a>b")
		puts line
	
		puts "a>b"
		sum += 1
	else
		puts line
		puts "a<b"

	end
end
puts sum

end

def test_q54
puts rank ["1H","2H","3H","6H","9H"]
puts rank ["1H","2H","3H","4H","5H"]
puts rank ["9D","TH","JH","QH","KH"]
puts rank ["9H","TH","JH","QH","KH"]
puts rank ["9D","TH","JH","QH","KH"]
puts rank ["2D","1H","1H","1H","1H"]
puts rank ["2D","2H","1H","1H","1H"]
puts rank ["2D","3H","1H","1H","1H"]
puts rank ["2D","2H","3H","1H","1H"]
puts rank ["2D","3H","4H","1H","1H"]
puts rank ["2D","3H","4H","6H","1H"]
p hash_pair [1,3,4,5,4]
p hash_pair [4,3,4,5,4]
end


def test_q54_2
#hand = "TH 8H 5C QS TC 9H 4D JC KS JS"
hand = "8S 5D 8H 4C 6H KC 3H 7C 5S KD"
a =  hand.split.slice(0..4)
b =  hand.split.slice(5..9)
puts compare a ,b
end
test_q54_2
#
#
def q79
f = File.open("q79","r")
s = f.read.split("\n").uniq
h=[]
s.each { |str| h << str.slice(0..1)  << str.slice(1..2)  << str.slice(0..0) + str.slice(2..2)}
h.uniq!

#Then , use your eye to examine h .....
#within 30 second , get 73162890
#It is an evidence that We are as human are clever then Computer
p h.sort
end


#q38..........
def q38
	#should be less 9999
	h=[]
	9999.downto(191)  do |v|
		#the default parameter to inject is also imporant ,that will make "s" an string , 
		#and t will be the first element of the Enumable
		#If we dont specify the parameter to inject , s set as the first element of the Enumable , 
		#t will be the second element. Note the difference?!
		o = (1..9).inject("") { |s ,t| 
			s << (t*v).to_s ; 
			next s if s.size > 9 or s.slice(0).chr < "9"
			if s.split("").sort.to_s.eql?("123456789")
				puts "find v = #{v} , n = #{t}"
				h << s.to_i 
			end
			#its important to return this , as this will be the yield in the inject method
			#as the first argument to the block for next iteration and work as the final return value 
			#
			s
		}
	end
	
	#OK. the max in the h
	p h.sort.last
end


#q47=========
require  'mathn.rb' 
def q47
	s = 0
	600.upto(1_000_000){  |v|
	
	if v.prime_division.map {|t| t[0]}.size.eql?(4) then s+=1	else s = 0 end

	if s.eql?(4)
		puts v - 3 
		break
	end


	}

end


def gen_prime_table
#out put all the prime below to 1_000_000 to an array that can be load
primes = {} 
p = Prime.new
while ((v = p.next) < 1_000_000)
	primes[v]=1
end
p primes
end

#gen_prime_table


def load_prime_table
	p={}
	data = File.open("primes_table","r").read	
	eval("p=#{data}")
	p	
end

#q35..............

def rotation n

	s = n.to_s
	return [n] if s.size.eql?1
	
	rs = []

	#the last one is itself - n	
	begin	
		r = s.slice(1..s.size-1) + s.slice(0..0)
		rs << r
		s = r
	end until r.eql?(n.to_s)

	r = rs.map {|t| t.to_i}
end


def q35

	p = load_prime_table
	circular_primes = []
	p.keys.sort.each do |key|	
		circular_primes << key if rotation(key).inject(true) {|s,t| s &&= p.key?(t) }
	end
	p circular_primes
	puts circular_primes.size
end

#puts load_prime_table.keys.sort.last
#q35
#
def q206
	puts "working on euler206.."
	#it should be 1xxxxxx30
	100000030.upto(199999930) do |v|
		t = (v**2).to_s
		next unless t.size==19
		if !(t =~ /^1.2.3.4.5.6.7.8.9.0$/).nil?
			puts v 
			break
		end	
	end

end


#if you need help of Prime , open this 
#sum of primes (0..i)
$sum=[2]
$prime_hash = load_prime_table
$p = $prime_hash.keys.sort
$max_prime = $p.last
puts "NOTICE: the max of prime in the hash is #{$p.last}"
def isPrime a
	if a < $max_prime 
		return $prime_hash.key?(a)
	else
		return false if $p.any? {|m| a % m == 0}
		return true
	end

end

raise "Error" if isPrime(950200117) == false
raise "Error" if isPrime(9502000002) == true
def build_sum

$p.each_with_index do |v,i|
	next if i == 0 
	$sum[i] = $sum[i-1] + v
end
end


def q50_sum i , j
	i , j = j , i if i > j
	$sum[j] - $sum[i] + $p[i]
end


def q50

	puts "working on euler 50"
	build_sum
	max_v = 0
	max_length = 0
	#check to see if sum(i,j) is prime
	#instead if to check the longest sum sequence for each each prime 
	pp = $p.reject {|i| i > 1_000_000}
	len = pp.length - 1
	max_length = 21 
	0.upto(len ) do |i|
		len.downto(i + max_length) do |j|
			sum = q50_sum(i,j)
			next if sum > 1_000_000
			if  $prime_hash.key?(sum) and ( j - i + 1> max_length)
				puts "find max for start at #{i}, end at #{j}"
				if (j - i + 1 > max_length)
					max_length = j - i + 1
					max_v = sum
					puts "max_prime = #{max_v} , len = #{max_length}"	
				end
				#jump to next start i
				break  
			end 
		end
	end
	puts "max_prime = #{max_v} , len = #{max_length}"	
end

def q46

	33.upto(1_000_000) do |n|
	#it should be composite
		next if isPrime(n)
		next if n%2==0
		t = (1..(n/2)**0.5).inject([])  {|acc,i| acc << n - 2*i**2}
		if	not t.any? {|i| isPrime i}
			puts n 
			break
		end

	end

end


def perm? a 

	h = a.first.to_s.split("").sort

	a.all? {|x| x.to_s.split("").sort.eql?(h)}

end

def q49

(1000..4000).each do |i|

	a = [i , i + 3330 , i+6660]
	
	if perm? a  and a.all? {|x| isPrime x}
		puts a.to_s
	end

end

end



#c(n) = 1 + 1 / (1 + c(n-1))
#suppose c(n-1) = a /b 
#c(n) = (a + 2b ) / (a + b)
def q57

a , b = 3 , 2
s=0
1.upto(1000) do | i|
	a ,b  = a + 2 * b , a + b
	s +=1 if a.to_s.size > b.to_s.size  
end

puts  s
end



def diag n

a = (2..n).to_a.reject {|i| i % 2 == 0}

s =  a.inject([]) {|s,i| 
	s << i*i 
	s << i*i - 1 *( i - 1)
	s << i*i - 2 *( i - 1)
	s << i*i - 3 *( i - 1)
}

s << 1

end

def q58

total_item = 1
total_prime = 0
(3..10**8).step(2) do |i|
	total_item += 4
	new_item=[]
	new_item << i*i 
	new_item << i*i - 1 *( i - 1)
	new_item << i*i - 2 *( i - 1)
	new_item << i*i - 3 *( i - 1)
	total_prime += new_item.select {|n| isPrime n }.size 
	puts " #{i} #{total_prime.to_f/total_item}"
	if total_prime.to_f/total_item <= 0.1
		puts  "ans #{i}"
		exit
	end	
end

end


def gen f
   (1..10000).map {|n| f.call(n)}.select {|m| (1000..9999).include?(m)}
end


def q61
#woo..a good use of Strategy Pattern..
a8 = gen(lambda {|n| n * (3 * n - 2)})
a7 = gen(lambda {|n| n * (5 * n - 3) / 2})
a6 = gen(lambda {|n| n * (2 * n - 1)})
a5 = gen(lambda {|n| n * (3 * n - 1) / 2})
a4 = gen(lambda {|n| n * n})
a3 = gen(lambda {|n| n * (n+1) / 2 })

[a3,a4,a5,a6,a7,a8].each do |a|
	puts "------------------------------"
	puts "size = #{a.size}"
	puts  a.inspect
	puts a.map {|n| s=n.to_s[0..1]}.uniq.inspect
	puts a.map {|n| s=n.to_s[2..3]; if s < "10" then nil else s end}.compact.uniq.inspect
end
end


def q63
 s = (1..100).to_a.inject(0) do |s,v| 
		s +=	(1..10).to_a.map {|n| n**v}.map {|i| i.to_s.size}.count(v)
 	end
puts s 
end

$hash_89={89=>1}
$hash_1={1=>1}
def final_chain i 
	return 89 if $hash_89.key?(i)
	return 1 if $hash_1.key?(i)
	#New value , need evalutaion
	v = final_chain(i.to_s.split("").inject(0) {|s,n| s+=(n.to_i**2)}) 
	raise "result is not correct" unless [1,89].include?(v)
	if v == 89 then $hash_89[i]=1 else $hash_1[i]=1 end
	v	
end

def q92

r = (2..10_000_000).to_a.inject(0) do |s,i|
	s = if final_chain(i) == 89 then s+1 else s end
end

puts r

end

def q81

=begin
q=%Q{131 673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331
}
=end

q=File.open("q81_matrix.txt").read
min_so_far=[0]
a = q.split("\n").map {|l| l.split(",").map {|s| s.to_i}}
#puts a.inspect
a.each_with_index do |line ,i|
	line.each_with_index do |n, j|
		if i == 0 
			min_so_far[j] = min_so_far[j-1] + n	
			#puts min_so_far.inspect
		else
			if j == 0
				min_so_far[j] += n
			else
				min_so_far[j] = [min_so_far[j] ,min_so_far[j-1]].min + n
			end
			#puts min_so_far.inspect
		end
	end
end

puts min_so_far.last
end


class Array

	# 0  0,  
	#         3  - win 
	#         2  - lose       
	#         1  - win  
	# 1  0
	# 	     
	# 2  0
	# 3  0   
	#
	#
	#
	def win_or_lose?
	
		#classify configuration base on how many zero element it has	
		return :win   if self.count(0).eql?(0) and self.uniq.size.eql?(1)   #[5,5,5]
		return :lose  if self.count(0).eql?(0) and self.uniq.size.eql?(2)   #[2,11,11]
		return :win   if self.count(0).eql?(0) &&  self.uniq.size.eql?(3)   #[4,23,78]

		#return :win   if self.count(0).eql?(1) &&  self.uniq.size.eql?(1)   #[0,0,0]
		return :win   if self.count(0).eql?(1) &&  self.uniq.size.eql?(2)   #[0,11,11]
		return :lose  if self.count(0).eql?(1) &&  self.uniq.size.eql?(3)   #[0,4,5]
		return :win   if self.count(0).eql?(2)                              #[0,0,5]
			

		raise "unexpect type"	
	end
end

def assert exp

	raise "Assert fail" unless exp == true

end
def q260

	assert [5,5,5].win_or_lose? == :win
	assert [0,0,5].win_or_lose? == :win
	assert [4,23,78].win_or_lose? == :win
	assert [0,11,11].win_or_lose? == :win
	assert [2,11,11].win_or_lose? == :lose
	assert [0,4,5].win_or_lose? == :lose

	#force loosing , two case
	#case 1 : 
	#return :lose  if self.count(0).eql?(1) &&  self.uniq.size.eql?(3)   #[0,4,5]
	sum = (1..100).to_a.combination(2).to_a.inject(0) {|s,e| s + e[0] + e[1] }

	#case 2 :
	#return :lose  if self.count(0).eql?(0) and self.uniq.size.eql?(2)   #[2,11,11]
	for i in (1..100)
		sum += i * 99
		sum +=	(1..100).to_a.reject{|x| x == i }.map {|x| x*2}.inject(0) {|s,v1| s + v1}
	end

	puts sum
end


def gcd a ,b 
	return a if b.zero?
	gcd b , a % b 
end


def phi n
	return n -1 if isPrime n

 	#number_of_divisor = n.prime_division.map { | _ ,m| m + 1}.inject(1) {|v , a | v*a}		
	(1...n).to_a.select {|m|  gcd(n ,m) == 1}.size

end

def q69

	max_t , max_n = 2 , 2 
	2.upto(1_000_000) do |n|
		c = phi n 
		t = n.to_f/c
		if t > max_t
				max_t = t
				max_n = n 
		end	
	end

	puts "you are waiting #{max_n}"
end

q69

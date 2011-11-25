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

	h={}
	a.each do |v|
		if h.key?(v) then h[v]+=1 else h[v]=1 end
	end	
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
	 	hp_a.values.sort {|x,y| y<=>x }.each { |v| h_a << hp_a.index(v) }
		h_b=[]
	 	hp_b.values.sort {|x,y| y<=>x }.each { |v| h_b << hp_b.index(v) }
	
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

q54

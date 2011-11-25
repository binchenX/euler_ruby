def assert f
	if not f == true
		puts "failed"
	end
end

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
	else "not expected"
	end

end


def q17
	s = "one thousand".gsub(" ",'').size
	1.upto(999) {|t|  s += translate(t).gsub(" ",'').size}
	s
end

assert (q17 == 21124)

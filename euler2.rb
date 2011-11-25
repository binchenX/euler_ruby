
def q206
REGEX = /1.2.3.4.5.6.7.8.9.0/
 
i = (1929394959697989990 ** (0.5)).to_i
i = i + (10 - (i % 10))
 
while true
  if (i ** 2).to_s =~ REGEX
    puts i
    break
  end
  i -= 10
  puts i if i % 1000 == 0
end

end

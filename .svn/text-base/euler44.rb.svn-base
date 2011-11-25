#!/usr/bin/ruby 


def pata? a 

 n =  (1 + (1 + 24 * a)**0.5 ) / 6 
 n =  n.to_i
 return true if  pata_by(n) == a
 return false

end

def pata_by n 
	n * (3*n -1) /2
end

raise "Error " if pata?(12) != true
raise "Error " if pata?(22) != true
raise "Error " if pata?(23) != false



t_start = Time.now
(1..10**8).to_a.each do |pj_pk_root|

	(1..pj_pk_root-1).each do |k|
			pk  = pata_by k
			pj_sub_pk = pata_by pj_pk_root

			pj = pk + pj_sub_pk
			pj_add_pk = pj + pk

			if pata?(pj) and pata?(pj_add_pk)
				puts "minmized pj_sub_pk is #{pj_sub_pk} #{pk} #{pj}"
				exit
			end 

	end	


end

puts Time.now - t_start

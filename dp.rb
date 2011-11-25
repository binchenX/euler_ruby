#!/usr/bin/env ruby




def max_subarray_sum arr

#for every element we visitor ,get the max_sum ,start ,end index
max=[]
arr.each_with_index do |v,i|
	if i==0 then max[i]=v ;next; end
	#we care about only previous one
	max[i] = max[i-1] > 0 ? max[i-1] + v : v 

end
p max
puts max.max
end


max_subarray_sum [1,2,-5,4,7,-2]
max_subarray_sum [1,5,-3,4,-2,1]

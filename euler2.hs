module Main where
import Data.List
isPrime :: (Integral a )=> a -> Bool
isPrime 1 = error "1 should not be evaluated"
isPrime 2 = True
isPrime 3 = True
isPrime a 
	| a < 0 = False
	|otherwise = if any (divisor a ) [2..floor $ sqrt $ fromIntegral a] then False else True
				where divisor a  b = if a `mod` b == 0 
									 then True
									 else False

--euler 27
value a  b = 
	let l = length $ takeWhile (isPrime) $ map (\n->n^2 + a * n + b) [0..]
	in (l, a ,b)

euler27 = let tuple_list = [value a b | a <-[0..999] , b <- [0..999]]
		  in foldr (\(n,a,b) (max,v) -> if n > max then (n , a * b) else (max ,v) ) (0,0) tuple_list
 
--maximumBy (\x y -> compare (num x ) (num y)) tuple_list 
--							where num (n,a,b) = n
--foldr (\(n,a,b) (max,v) -> if n > max then (n , a * b) else (max ,v) ) (0,0) tuple_list

main = print euler27

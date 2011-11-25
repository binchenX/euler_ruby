module Main where
import Data.Char (digitToInt)
import Data.List
isPrime :: (Integral a )=> a -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime 3 = True
isPrime a 
	| a < 0 = False
	|otherwise = if any (divisor a ) [2..floor $ sqrt $ fromIntegral a] then False else True
				where divisor a  b = if a `mod` b == 0 
									 then True
									 else False

euler10 =  sum $ filter (isPrime) [2..10^6]

--euler40 begin
--
index i = digitToInt $ (foldr (\x acc -> show x ++ acc) "" [1..10000000] ) !!( i -1 )

euler40 = product $ map (index) $ map (10^) [0..6] 


--main = print euler40
--
--euler 27
value :: (Integral a) => a->a->(Int,a,a)
value a  b = 
	let l = length $ takeWhile (isPrime) $ map (\n->n^2 + a * n + b) [0..]
	in (l, a ,b)

euler27 = let tuple_list = [value a b | a <-[-999..999] , b <- [-999..999]]
		  in foldl' (\(max ,v) (n,a,b) -> if n > max then (n , a * b) else (max ,v) ) (0,0) tuple_list
 


--euler 33
--filter (\(a,b,c) -> if (a*10+b)/(b*10+c) == a/c && a / c < 1 then True else False) [ (a,b,c) |a <- [1..9] ,b <- [1..9] ,c <- [1..9]] 

#lang racket
;Pascal's triangle - generating it is pretty easy - row r, column n,
;calue in rCn



;nCr = i (1 -> r) : pi (n - i + 1)/ i
;nCr =  i(0 -> r-1) : (n - i) / (r - i)



(define (combinationValue i N R)
	(/ 
		(+ N (- i) 1)
		i
	)
)


(define (increment i)(+ i 1))

(define (combinationIter i N R total)
	(if (> i R)
		;then
		total
		;else
		(combinationIter
			(increment i)
			N 
			R
			(* total (combinationValue i N R))
		)
	)
)

; N >= R
(define (combination N R)
	(combinationIter 1 N R 1)
)




(combination 10 0)
(combination 10 1)
(combination 10 2)
(combination 10 3)
(combination 10 4)
(combination 10 5)
(combination 10 6)
(combination 10 7)
(combination 10 8)
(combination 10 9)
(combination 10 10)


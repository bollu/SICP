#lang racket

(define (inc x)(+ x  1.0))
(define (dec x)(- x  1.0))

(define (add a b)
	(if (= a 0)
		b
		(inc 
			(add (dec a) b)
	 	)
	)
)



;add 2 2
;inc (add 1 2)
;int (inc (add 0 2))
;inc (inc (2))
;inc 3
;4

;obviously recursive. LOOK at the definition :) it expands inc until the counter hits 0. once the counter hits 0,
;it applies all of the increments on the base number, to get the sum.
;so, yeah, recursive
(add 2 2)


(define (altadd a b)
	((if = a 0)
		b
		(altadd
		 	(dec a) (inc b)
		)
	)
)

;add 2 2
;add (2 - 1) (2 + 1) =>
;add 1 3
;add (1 - 0) (3 + 1) =>
;add 0 4
;4

;obviously iterative. there is no "expanding" going on at all. you could even just continue evaluating at (add 1 3) and
;it would follow the same steps to reach (add 0 4) and then give the answer. There is no data hidden on the function stack :)
(add 2 2)

#lang racket


(define (-- num)(- num 1))


(define (pow num exponent)
	(if (= exponent 0)
		;then
		1
		;else
		(* num 
			(pow num (-- exponent))
		)
	)
)

(pow 2 3)

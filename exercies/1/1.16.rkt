#lang racket

;split the exponent into the part that is left when divided by 2 and the
;remainder that is left when divided by 2.
;the part that is perfectly divisible by 2 can be computed by just squaring the square of 
; the number and so on

;i.e- b^8 = (((b^2)^2)^2) = (b)^(2*2*2) = b^(8)
;but b^9 = (b^8).b = (((b^2)^2)^2).b = (b)^(2*2*2).b 
;so, the first two branches of the power-iter function computes the powers that are
;powers of two. The leftover part that is the remainder is sent to 
;power again- so that it again can be split into smaller powers of two. this goes on
;till all the parts are multiplied

;b^27 = b^16.b^8.b^2.b^1 
;b^50 = b^32.b^16.b^2



(define (square num)(* num num))
(define (double num)(* num 2))

(define (power-iter baseNum total currentIter maxIter)
	(cond 
		(
			(= currentIter maxIter)
				;then
				total
		)
		
		;else if	
		(
			(<= (double currentIter) maxIter)
				;then
				(power-iter baseNum (square total) (double currentIter) maxIter)
		)
		;else
		(else
			(* total (power baseNum (- maxIter currentIter)))

		)
	)
)

(define (power num exponent)
	(power-iter num  num 1 exponent)
)

(power 9 9)
(power 10 4) 
(power 11 4) 

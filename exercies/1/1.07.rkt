#lang racket

(define (avg x y) (/ (+ x y) 2.0))
(define (abs x)(if (> x 0) x (- x)))
(define (square x)(* x x))
(define (delta x y) ( abs (- x y)) )


; make a better approximation with base number and the previous approximation 
(define (betterApproximation number prevApproximation) (avg (/ number prevApproximation) prevApproximation))

; get the delta between the current approximation and the next approximation
(define (approximationDelta number approximation) (delta approximation (betterApproximation number approximation)) 	)

;approximationIterator
;if approximationDelta < minApproxDelta
;return approximation;
;else approximationIterator (betterApproximation) (approximationDelta)


;if the delta between the current & next one is too small to care about, return the approximation
;otherwise, make a better approximation and check again 
(define (approximationIterator number approximation )
	(if 
		(< (approximationDelta number  approximation) 0.0001) 
		approximation ; then

		(approximationIterator number ;else
			(betterApproximation number approximation)
		);else	
	)) 


(define (sqrt x) (approximationIterator x 1) )

;whoa, WTH! does it not overflow?
;turns out, not really -> http://docs.racket-lang.org/reference/numbers.html#%28tech._flonum%29

;quoted text--------
;The precision and size of exact numbers is limited only by available memory 
;(and the precision of operations that can produce irrational numbers). 
;In particular, adding, multiplying, subtracting, and dividing exact numbers always produces an exact result.
;end-----------------
;hell, I might end up using scheme for my weird little projects from now on. It seems faster than python 
(sqrt 122336789123456789123456789443322)



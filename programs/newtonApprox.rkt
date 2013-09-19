#lang racket


(define (avg x y) (/ (+ x y) 2.0))
(define (abs x)(if (> x 0) x (- x)))
(define (square x)(* x x))


; make a better approximation with base number and the previous approximation 
(define (betterApproximation number prevApproximation) (avg (/ number prevApproximation) prevApproximation))


; check if the square of the approximation is approximately equal to the real deal
(define (approximationAcceptable number approximation) ( < (abs (- (square approximation) number) ) 0.0001) )


; start with some number. see if approximation is "okay." (if the square of the approximation is, well, approximately
;equal to the number or not). If the approximation is fine, return it. Otherwise, make a "better" approximation
;and check if that one is "okay" and so forth. 
(define (netwonAppromiation number approximation)
	(if (approximationAcceptable number approximation) 
		approximation 
		(netwonAppromiation number (betterApproximation number approximation))))


; just start the newtonian approximation at some random number. I use 1. 
(define (sqrt number)(netwonAppromiation number 1))

(sqrt 100)

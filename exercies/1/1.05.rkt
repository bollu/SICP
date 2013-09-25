;whoa, this is *sneaky* and cool at the same time. 

; in applicative order, (test 0 (p)) is present. The interpreter tries to reduce p. 
; but on trying to do so, it produces the expression (test 0 (p)) *again*, since (p) = (p).

;if you were in normal order, (test 0 (p)) first gets reduced to (if (= 0 0) 0 (p)) which evaluates to 0, never
;having to touch p altogether. Freaky!

#lang racket

(define (p) (p))

(define (test isZero value) (if (= isZero 0) 0 value))

(test 0 (p))
; looks like racket is applicative!

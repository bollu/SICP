#lang racket

(define (greatest2 a b) (if (> a  b) a  b))

(define (greatest3 a b c)(greatest2 (greatest2 a b) c) )


(define (sumOfSquares a b)(+ (* a a) (* b b)))

(define (f a b c )(greatest3 (sumOfSquares a b) (sumOfSquares b c) (sumOfSquares a c) ))

(f  0 1 -2)





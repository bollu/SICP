#lang racket

(define (frecursive n)
	(if (< n 3) 
     ;then
    	n 
     ;else
    	(+ (frecursive (- n 1)) 
    		(* 2 (frecursive (- n 2)))
    		(* 3(frecursive (- n 3)))
    	)
    ) 
)




;the iterative function works by counting "up" from f(3).
;the output of the prev 3 functions of f(3) are f(2) = 2, f(1) = 1, f(0) = 0.
;so start iteration at f(3) with the previous 3 coefficients. 

;Then, we can compute f(3) by using f(2), f(1) and f(0)
;To compute f(4), compute f(3). After doing so,
;f(x-1) becomes f(3), f(x-2) becomes f(2) and f(x-3) becomes f(1).
;So, keep computing successive values and keep swapping between
;f(x) and f(x-1), f(x-1) and f(x-2), f(x-2) and f(x-3). This leads to a 
;nice iterative process

;in C++ - it would look like this


;int fXMinus3 = 0, fXMinus2 = 1, fXMinus1 = 2, total = 0;
;
;for(int i = 3; i <= n; i++){
; int fX = fXMinus3 + 2*fXMinus2 + 3*fXMinus1;
; total += fX;
;
; fXMinus3 = fXMinus2;
; fXMinus3 = fXMinus1;
; fXMinus1 = fX;
;}

(define (f-calc f-x-minus-1 f-x-minus-2 f-x-minus-3)
  (+ f-x-minus-1 (* 2 f-x-minus-2) (* 3 f-x-minus-3) )
)

(define (f-it currentIteration totalIterations f-x-minus-1 f-x-minus-2 f-x-minus-3)
    (if (>= currentIteration totalIterations) 
        ;then
        (f-calc f-x-minus-1 f-x-minus-2 f-x-minus-3)
        ;else
        (f-it 
          (+ currentIteration 1) 
          totalIterations 
          
          (f-calc f-x-minus-1 f-x-minus-2 f-x-minus-3)
          f-x-minus-1
          f-x-minus-2)
    ) 
)

(define (fiterative n)
    (if (< n 3)
      ;then
      n
      ;else
      (f-it 3 n 2 1 0)
    )
)


;f(3) = f(2) + 2*f(1) + 3*f(0) = 2 + 2*1 + 3*0 = 2 + 2 + 0 = 4


;time for recursive -  11.59s
;(frecursive 35)

;time for iterative - 0.25s
(fiterative 35)

;in this case, iterative is much, much faster than recursive
(fiterative 40)




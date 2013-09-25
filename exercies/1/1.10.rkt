#lang racket

(define (A x y)
	(cond ((= y 0) 0)
		((= x 0)(* 2 y))
		((= y 1) 2)
		(else (A (- x 1) (A x (- y 1))))
	)
)

;2 * n

(A 0 2)
(A 0 3)
(A 0 4)
(display "-----\n")
;2 ^ n
(A 1 2)
(A 1 3)
(A 1 4)
(display "-----\n")
;2 ^ (2n - 1))
(A 2 2)
(A 2 3)
(A 2 4)
(display "-----\n")
(A 3 2)
(A 3 3)
(A 3 4)

;A 1 3
;A 0 (A 1 2)
;A 0 (A 0 (A 1 1))
;A 0 (A 0 2)
;A 0 (4)
;8



;A(1, n) = 2 ^ n
;the A function keeps x = 0 as a sort of "counter" and keeps decrementing y recursively till Y hits 1.
;due to Y becoming 1, the value of the A function becomes 2.
;now, it starts unrolling and it starts executing A(0 n) which returns 2n. Since our starting number was 2, 
;we get 2 * 2 = 4 on the 1st function pop-out. this happens y - times leading to the computation of 2 ^ y. sweet!

;

;let x-1 = t
;let A(x-n, y) = B(n, y)
;x =/= y =/= 0
;A x y
;A (x-1 (A x y-1)) =

;B(1, 
;	A(x, (y-1)
;)

;B(1, 
;	B(1, 
;		A(x, y-2)
;	)
;)

; B(1, B(1, B(1, .... B(1, y-(y-1))))) =  B(1, B(1, B(1,.... B(1, 1)))) = B(1, B(1,  B(1, .... A(x-1, 1)))) = B( B(... B(1, 2))))
;B( B(... B(1, 2)))) = B( B(... B(1, 2))))

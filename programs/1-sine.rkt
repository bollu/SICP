#lang racket

(define (cube x) (* x x x))

(define (abs x) 
	(if (>= x 0)
		;then
		x
		;else
		(- x)
	)
)


;sin3x = 3sinx - 4sin^3(x)
;now,
;sinx = 3sin(x/3) - 4sin^3(x/3)
;now, if x/3 is still > 1,
;again use the sin x expansion till x < 1
;so that we can return 1 and bottom up


(define (sine x)
	(if (< (abs x) 0.01)
		;then
		x

		;else
		(- 
			(* 3 (sine (/ x 3.0)))
			(* 4 (cube (sine (/ x 3.0))))
		)
	)
)

(sine 0.9)
(sine (/ 3.14 2))
(sine 3.14 )
(sine (* 3.14 2))
(sine 0)

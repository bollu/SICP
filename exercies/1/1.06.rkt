#lang racket


(define (avg x y) (/ (+ x y) 2.0))
(define (abs x)(if (> x 0) x (- x)))
(define (square x)(* x x))


; make a better approximation with base number and the previous approximation 
(define (betterApproximation number prevApproximation) (avg (/ number prevApproximation) prevApproximation))


; check if the square of the approximation is approximately equal to the real deal
(define (approximationAcceptable number approximation) ( < (abs (- (square approximation) number) ) 0.0001) )


;THIS IS REDEFINED FOR THE EXERCISE (Yes, I know, I hate caps lock too)
; start with some number. see if approximation is "okay." (if the square of the approximation is, well, approximately
;equal to the number or not). If the approximation is fine, return it. Otherwise, make a "better" approximation
;and check if that one is "okay" and so forth. 
;(define (approximationIterator number approximation)
;	(if (approximationAcceptable number approximation) 
;		approximation 
;		(approximationIterator number (betterApproximation number approximation))))


;ACTUAL EXERCISE PART FROM HERE-----------------------------------------------------------
;this one is loopy. I wasn't able to figure it out. StackOverflow to the rescue!
;http://stackoverflow.com/questions/1171252/whats-the-explanation-for-exercise-1-6-in-sicp

;turns out, on calling "if", scheme re-evaluates ALL of the parameters to newif. On doing so, It also tries to
;evaluate the else branch. now, the else branch invokes approximationIterator again, which in turn invokes newif
;which in turn tries to evaluate the else branch with the  approximationIterator... (you get the idea)
;so, 
;approximationIterator->newif->Evaluate Else->approximationIterator->newif->...
;the *actual* if condition does not do this. it evaluates the *condition* first leaving the rest of it
;untouched. once the condition is evaluated, it takes the then branch or the else branch.

;for these guys to have an understanding of the subtlety of the language at this level is plain freaky.
;bloody hell, this is just the first chapter! I can't wait to read the book fully.

;try and redefine if by using cond. Alas, this does have some corner cases
(define (newif condition thenBranch elseBranch )(cond (condition thenBranch) (else elseBranch)))

(define (approximationIterator number approximation) 
	(newif (approximationAcceptable number approximation) 
		approximation ;then
		(approximationIterator number (betterApproximation number approximation)))) ;else


(define (sqrt number)(approximationIterator number 1))

;haha, infinite loop sucker!
(sqrt 2)

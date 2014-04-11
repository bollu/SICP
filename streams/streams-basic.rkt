#lang racket

(define (hd stream)(car stream))
(define (tl stream) ((cdr stream)) )

;; natsfrom: nat? -> (streamof nat?)
(define (natsfrom n) (cons n (lambda() (natsfrom (add1 n)))))

;;; nats: (streamof nat?)
(define nats (natsfrom 0))

;;; +ves : (streamof nat?)

(define +ves (natsfrom 1))


;;; returns a list of the first i elements and the remaining computations
;;; unroll: [nat?  (streamof A) [(listof A) (streamof A) -> any/c]] -> any/c
(define unroll
  (lambda (num_iters stream callback)
      (letrec ([loop (lambda (num_iters built_list stream)
                       (cond
                        [(= num_iters 0) (callback built_list stream)]
                        [#t (loop (sub1 num_iters) (cons (hd stream) built_list) (tl stream))]))])
        (loop num_iters '() stream))))


(define (listify num_elems stream)
  (unroll num_elems stream (lambda (list stream) (reverse list))))


;;; Given a natural n and a stream s (curried),  returns (tl^n s).
;;; nat? -> (streamof A) -> (streamof A)
(define (drop num_elems stream)
    (unroll num_elems stream (lambda (list stream) stream))
)


;;; Curried application

;;; take returns the first n elements of a stream as a list
;;; nat? (streamof A) -> (listof A)




(drop 2 nats)



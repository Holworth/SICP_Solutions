#lang sicp
(define (make-accumulator init)
  (lambda (incre)
    (set! init (+ init incre))
    init))

(define A (make-accumulator 5))
(A 10)
(A 20)
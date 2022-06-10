#lang sicp
(define (square-list l)
  (map (lambda (x) (* x x)) l)
)

(square-list (list 1 2 3 4 5))
#lang sicp
;; Add element x into set, maintaining the order of set
(define (adjoint-set x set)
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        ((> x (car set)) (cons (car set) (adjoint-set x (cdr set))))))

(adjoint-set 5 (list 1 2 3 7))
(adjoint-set 10 (list 1 2 3 7))
(adjoint-set 10 (list 11 21 31 71))
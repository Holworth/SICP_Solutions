#lang sicp
(define (reduce op init items) 
          (cond ((null? items) init)
                (else (op (car items) 
                          (reduce op init (cdr items))))))
(define (horner-eval x coefficient-sequence)
  (reduce (lambda (this-coeff y) (+ this-coeff (* y x)))
          0 coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))
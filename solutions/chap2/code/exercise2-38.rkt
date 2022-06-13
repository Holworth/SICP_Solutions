#lang sicp
(define (reduce op init items) 
          (cond ((null? items) init)
                (else (op (car items) 
                          (reduce op init (cdr items))))))

(define (fold-right op init items) 
  (reduce op init items))

(define (fold-left op init items)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter init items))

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))
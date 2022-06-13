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

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(reverse-left (list 1 2 3 4))
(reverse-right (list 1 2 3 4))
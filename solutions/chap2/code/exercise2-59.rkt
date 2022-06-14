#lang sicp
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? (car set) x) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (union-set s1 s2)
  (if (null? s2)
      s1
      (union-set (adjoin-set (car s2) s1) (cdr s2))))

(union-set '(a b c) '(a d e))
(union-set '() '(a d e))

#lang racket

(define (abs x) 
  (if (< x 0)
      (- x)
      x))

(define (sq x) (* x x))

(define (good-enough? guess x) 
  (< (abs (- x (sq guess))) 0.001)
)

(define (avg x y) 
  (/ (+ x y) 2)
)

(define (improved-x guess x)
  (avg guess (/ x guess))
)

(define (new-if predicate then-clause else-clause)
  (cond ((predicate) (then-clause))
        (else else-clause))
)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improved-x guess x) x))
)

(define (sqrt x) (sqrt-iter 1.0 x))

(sqrt 2.0)
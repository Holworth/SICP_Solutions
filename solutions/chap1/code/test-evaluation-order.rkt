#lang racket

(define (p) (p))
(define (test x y) 
  (if (= x 0) 
      x
      y))

(test 0 (p))
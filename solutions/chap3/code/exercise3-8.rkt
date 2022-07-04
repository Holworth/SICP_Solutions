#lang sicp
(define f
  (let ((first 1))
    (define (func x)
      (if (= first 1)
          (begin (set! first 0) x)
           0))
  func))

(+ (f 1) (f 0))
(+ (f 0) (f 1))
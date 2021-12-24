#lang racket

(define (cube-root x)

  (define (abs x)
    (cond ((< x 0) (- x))
          (else x))
  )

  (define (cube x) (* x x x))

  (define (cube-root-iter guess x)

    (define (good-enough? guess x) 
      (< (abs (- (cube guess) x)) 0.0001)
    )

    (define (improved-guess guess x)
      (/ (+ (/ x (* guess guess)) guess guess)
        3)
    )

    (if (good-enough? guess x)
        guess
        (cube-root-iter (improved-guess guess x) x))
  )

  (cube-root-iter 1.0 x)
)

(cube-root 1.0)
(cube-root 2.0)

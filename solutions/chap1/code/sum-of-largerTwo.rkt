#lang racket

(define (sq x) (* x x))

(define (min x y) 
  (if (< x y) x y)
)

(define (min-of-three x y z) 
  (min x (min y z)))


(define sum-of-largerTwo
  (lambda (x y z) 
    (- (+ (sq x) (sq y) (sq z))
       (min-of-three x y z))
  )
)

(sum-of-largerTwo 1 2 4)
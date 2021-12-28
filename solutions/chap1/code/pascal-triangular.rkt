#lang racket

(define (pascal-triangular m n)
  (cond ((= m 1) 1)
        ((or (= n 1) (= n m)) 1)
        (else (+  (pascal-triangular (- m 1) (- n 1))  ; Element at left-above
                  (pascal-triangular (- m 1) n)))      ; Element above
  )
)

(pascal-triangular 1 1)
(pascal-triangular 2 2)
(pascal-triangular 3 2)
(pascal-triangular 5 3)
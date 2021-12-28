#lang racket
(define (recursivef n)
  (cond
    ((< n 3) n)
    (else (+ (recursivef (- n 1))
             (* 2 (recursivef (- n 2)))
             (* 3 (recursivef (- n 3)))))
  )
)

(define (iterf n)
  ; a = f(n-2), b = f(n-1), c = f(n)
  ; a <- f(n-1), b <- f(n), c <- f(n+1) = f(n) + 2f(n-1) + 3f(n-2)
  (define (iter a b c count)
    (if (= count 0)
        c 
        (iter b c (+ c (* 2 b) (* 3 a)) (- count 1)))
  )

  (if (< n 3)
      n
      (iter 0 1 2 (- n 2))  ; (- n 2) is the number to iterate
  )
)

;(recursivef 40)
(iterf 40)

(define (compose f g) 
    (lambda (x) (f (g x))))

(define (inc n) (+ n 1))
(define (square x) (* x x))

(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))
(define (fixpoint f guess)
    (define (try a)
        (newline)
        (display a)
        (let ((b (f a)))
            (if (close-enough? a b)
                b
                (try b))))
    (try guess))

(define (close-enough? a b)
    (< (abs (- a b)) 0.00001))

(define (average a b) (/ (+ a b) 2))

(define (root-without-average) (fixpoint (lambda (x) (/ (log 1000) (log x))) 5))
(define (root-with-average) (fixpoint (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 5))

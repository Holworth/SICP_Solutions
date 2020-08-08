(define (fixpoint f guess)
    (define (try a)
        (let ((b (f a)))
            (if (close-enough? a b)
                b
                (try b))))
    (try guess))

(define (close-enough? a b)
    (< (abs (- a b)) 0.00001))

(define (get-phi) 
    (fixpoint (lambda (y) (+ 1 (/ 1 y))) 1.0))

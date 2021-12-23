(define (make-interval a b) (cons a b))
(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))

(define (interval-contains0? y)
     (cond  ((and (< (lower-bound y) 0) (< 0 (upper-bound y))) true)
            ((or (= (lower-bound y) 0) (= (upper-bound y) 0)) true)
            (else false)))
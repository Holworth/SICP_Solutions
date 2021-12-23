(define (make-interval a b) (cons a b))
(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))

(define (interval-sub x y)
    (make-interval  (- (lower-bound x) (upper-bound y))
                    (- (upper-bound x) (lower-bound y))))
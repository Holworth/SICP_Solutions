(define (make-center-percent m p)
    (cons (- m (* m p)) (+ m (* m p))))

(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))
(define (interval-len x) (- (upper-bound x) (lower-bound x)))

(define (center x)
    (/ (+ (upper-bound x) (lower-bound x)) 2))

(define (percent x)
    (let   ((m (center x))
             (l (interval-len x)))
        (/ (/ l 2) m)))
(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (make-rectangle left-above right-below)
    (cons left-above right-below))

(define (left-above rectangle)
    (car rectangle))

(define (right-below rectangle)
    (cdr rectangle))

(define (circum rectangle)
    (let ((labove (left-above rectangle))
          (rbelow (right-below rectangle)))
        (* (+ (- (x-point rbelow) (x-point labove))
              (- (y-point rbelow) (y-point labove)))
           2)))

(define (area rectangle)
    (let ((labove (left-above rectangle))
          (rbelow (right-below rectangle)))
         (* (- (x-point rbelow) (x-point labove))
            (- (y-point rbelow) (y-point labove)))
    ))
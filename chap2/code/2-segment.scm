(define (make-point x y)
    (cons x y))

(define (x-point point)
    (car point))

(define (y-point point)
    (cdr point))

(define (print-point point)
    (newline)
    (display "(")
    (display (x-point point))
    (display ",")
    (display (y-point point))
    (display ")"))

(define (make-seg start-point end-point)
    (cons start-point end-point)) 

(define (start-point seg)
    (car seg))

(define (end-point seg)
    (cdr seg))

(define (mid-point seg)
    (let ((start (start-point seg))
          (end   (end-point seg)))
    (make-point (average (x-point start) (x-point end))
                (average (y-point start) (y-point end)))))

(define (average a b) (/ (+ a b) 2))
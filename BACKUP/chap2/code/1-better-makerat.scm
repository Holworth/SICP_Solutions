(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (make-rat-help n d)
    (let ((g (gcd (abs n) (abs d))))
         (cons (/ n g) (/ d g))))

(define (make-rat n d)
    (cond   ((< (* n d) 0) (make-rat-help (-(abs n)) (abs d)))
            (else (make-rat-help (abs n) (abs d)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
    (newline)
    (display (numer x))
    (display "/")
    (display (denom x)))

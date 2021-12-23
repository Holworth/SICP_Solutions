(define (cons a b)
    (* (pow 2 a) (pow 3 b)))

(define (pow a b)
    (define (pow-iter a b product)
        (if (= b 0)
            product
            (pow-iter a (- b 1) (* product a))))
    (pow-iter a b 1))

(define (car n)
    (define (car-iter n count)
        (if (> (remainder n 2) 0)
            count
            (car-iter (/ n 2) (+ count 1))))
    (car-iter n 0))

(define (cdr n)
    (define (cdr-iter n count)
        (if (> (remainder n 3) 0)
            count
            (cdr-iter (/ n 3) (+ count 1))))
    (cdr-iter n 0))
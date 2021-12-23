(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))

(define (factorial n)
    (define (inc n) (+ n 1))
    (define (id n) n)
    (product id 1 inc n))

(define (pi-sum n)

    (define (inc n) (+ n 1))

    (define (numer n)
        (if (even? n)
            (+ n 2)
            (+ n 1)))

    (define (denom n)
        (if (even? n)
            (+ n 1)
            (+ n 2)))
    (* 4.0
       (/ (product numer 1 inc n)
          (product denom 1 inc n))))

(define (product-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* (term a) result))))
    (iter a 1))

(define (pi-sum-iter n)

    (define (inc n) (+ n 1))

    (define (numer n)
        (if (even? n)
            (+ n 2)
            (+ n 1)))

    (define (denom n)
        (if (even? n)
            (+ n 1)
            (+ n 2)))
    (* 4.0
       (/ (product-iter numer 1 inc n)
          (product-iter denom 1 inc n))))
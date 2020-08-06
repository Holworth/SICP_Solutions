(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
                  (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
    (define (add a b) (+ a b))
    (accumulate add 0 term a next b))

(define (product term a next b)
    (define (mul a b) (* a b))
    (accumulate mul 1 term a next b))

;;; following are for test: 
;;; recursive calculation process

(define (int-sum n)
    (define (id n) n)
    (define (inc n) (+ n 1))
    (sum id 1 inc n))

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

(define (accumulate-iter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner (term a) result))))
    (iter 1 null-value))

(define (sum-iter term a next b)
    (define (add a b) (+ a b))
    (accumulate-iter add 0 term a next b))

(define (product-iter term a next b)
    (define (mul a b) (* a b))
    (accumulate-iter mul 1 term a next b))

;;; following are test for iteration calculation process

(define (int-sum-iter n)
    (define (id n) n)
    (define (inc n) (+ n 1))
    (sum-iter id 1 inc n))

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
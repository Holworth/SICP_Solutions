(define (filtered-accumulate combiner null-value filter? term a next b)
    (define (filtered-combiner a b)
        (if (filter? a)
            (combiner a b)
            b))
    (if (> a b)
        null-value
        (filtered-combiner (term a)
                           (filtered-accumulate combiner null-value filter? term (next a) next b))))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (if( = n 1)
       false
       (= (smallest-divisor n) n)))

(define (prime-sum a b)
    (define (inc n) (+ n 1))
    (define (id n) n)
    (define (add a b) (+ a b))
    (filtered-accumulate add 0 prime? id a inc b))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(define (relative-prime-product n)
    (define (relative-prime? k)
        (if (= (gcd k n) 1)
            true
            false))
    (define (inc n) (+ n 1))
    (define (id n) n)
    (define (mul a b) (* a b))
    (filtered-accumulate mul 1 relative-prime? id 1 inc n))

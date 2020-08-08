(define (cont-frac n d k)
    (define (f i)
        (if (= i k)
            (/ (n i) (d i))
            (/ (n i) (+ (d i) (f (+ i 1))))))
    (f 1))

(define (d i)
    (cond ((or (= (remainder i 3) 0) (= (remainder i 3) 1)) 1)
           (else (* (/ (+ i 1) 3) 2))))

(define (get-e k)
    (+ 2 (cont-frac (lambda (i) 1.0)
               d
               k)))

(define (cont-frac-iter n d k)
    (define (f-iter i result)
        (if (= i 1)
            result
            (f-iter (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) result)))))
    (f-iter k (/ (n k) (d k))))

(define (get-e-iter k)
    (+ 2 (cont-frac-iter (lambda (i) 1.0)
               d
               k)))
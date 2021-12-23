(define (cont-frac n d k)
    (define (f i)
        (if (= i k)
            (/ (d i) (n i))
            (/ (n i) (+ (d i) (f (+ i 1))))))
    (f 1))

(define (get-phi k)
    (cont-frac (lambda (i) 1.0)
               (lambda (i) 1.0)
               k))

(define (cont-frac-iter n d k)
    (define (f-iter i result)
        (if (= i 1)
            result
            (f-iter (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) result)))))
    (f-iter k (/ (n k) (d k))))

(define (get-phi-iter k)
    (cont-frac-iter (lambda (i) 1.0)
                    (lambda (i) 1.0)
                    k))
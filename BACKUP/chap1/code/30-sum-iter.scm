(define (sum-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))))
    (iter a 0))

(define cube (lambda (y) (* y y y)))

(define (integral f a b dx)
 (define (add-dx x) (+ x dx))
 (* (sum-iter f (+ a 
              (/ dx 2))
        add-dx
        b)
    dx))

            

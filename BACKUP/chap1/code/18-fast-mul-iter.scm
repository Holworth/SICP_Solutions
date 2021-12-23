(define (fast-mul-iter counter b product)
 (cond ((= counter 0) product)
       ((even? counter) (fast-mul-iter (halve counter) (double b) product))
       (else (fast-mul-iter (- counter 1) b (+ product b)))))

(define (fast-mul a b)
 (fast-mul-iter b a 0))

(define (double a)
 (+ a a))

(define (halve a)
 (/ a 2))


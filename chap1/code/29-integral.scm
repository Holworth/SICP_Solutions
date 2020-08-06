(define (sum term a next b)
 (if (> a b)
     0
     (+ (term a)
        (sum term (next a) next b))))

(define cube (lambda (y) (* y y y)))

(define (integral f a b dx)
 (define (add-dx x) (+ x dx))
 (* (sum f (+ a 
              (/ dx 2))
        add-dx
        b)
    dx))

(define (Sipson-integral f a b n)
 (define h (/ (- b a) n))

 (define (cof k)
  (cond ((or (= k 0) (= k n)) 1)
         ((even? k) 2)
         (else 4)))

 (define (term n)
  (* (cof n)
     (f (+ a (* n h)))))
 
 (define (inc n) (+ n 1))
 
 (* (sum term 0 inc n)
    (/ h 3.0)))
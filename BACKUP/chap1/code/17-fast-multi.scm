(define (mymul a b)
 (cond ((= b 0) 0)
       ((even? b) (double (mymul a (halve b))))
       (else (+ a (mymul a (- b 1))))))

(define (double a)
 (+ a a))

(define (halve a)
 (/ a 2))

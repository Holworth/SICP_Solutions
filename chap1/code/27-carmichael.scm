(define (expmod base exp m)
    (cond ((= exp 0)
            1)
          ((even? exp)
            (remainder (square (expmod base (/ exp 2) m))
                       m))
          (else
            (remainder (* base (expmod base (- exp 1) m))
                       m))))

(define (square a)
 (* a a))

 (define (even? a)
 (= (remainder a 2) 0))

 (define (carmichael-test n a)
 (cond ((= a 1) true)
       ((= (expmod a n n) a) (carmichael-test n (- a 1)))
       (else false)))

(define (carmichael? n)
 (carmichael-test n (- n 1)))
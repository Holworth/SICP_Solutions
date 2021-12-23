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

 (define (fermat-test n)
  (define (try-it a)
   (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
 (cond ((= times 0) true)
       ((fermat-test n) (fast-prime? n (- times 1)))
       (else false)))

(define (prime? n)
 (fast-prime? n 10))

(define (timed-prime-test n)
 (newline)
 (display n)
 (start-prime-test n (real-time-clock)))

(define (start-prime-test n start-time)
 (if (prime? n)
     (report-prime (- (real-time-clock) start-time))))

(define (report-prime elapsed-time)
 (display "***")
 (display elapsed-time))

(define (primes-near n count)
 (cond ((= count 0) (newline)
                    (display "finished"))
       ((prime? n)  (newline)
                    (display n)
                    (primes-near (+ n 2) (- count 1))
       )
       (else (primes-near (+ n 2) count))))

(define (time-search n)
 (let ((start (real-time-clock)))
  (primes-near n 3)
  (- (real-time-clock) start)))
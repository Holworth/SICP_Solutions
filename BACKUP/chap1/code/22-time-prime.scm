(define (smallest-divisor n)
 (find-divisor n 2))

(define (find-divisor n test-divisor)
 (cond ((> (square test-divisor) n) n)
       ((divide? test-divisor n) test-divisor)
       (else (find-divisor n (+ test-divisor 1)))))

(define (square a)
 (* a a))

(define (divide? a b)
 (= (remainder b a) 0))

(define (prime? n)
 (= n (smallest-divisor n)))

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
 
 

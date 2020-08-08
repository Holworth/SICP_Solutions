;;;16-fast-exp.scm
(define (fast-exp b n)
 (fast-exp-iter b n b))

(define (fast-exp-iter b counter product)
  (cond ((= counter 1) product)
	((even? n) (fast-exp-iter (* b b) (/ counter 2) product))
	(else (fast-exp-iter b (- counter 1) (* product b)))))

(define (even? n)
 (= (remainder n 2) 0))

  

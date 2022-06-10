#lang sicp

(define (square-list items)
  (define (iter things ans) 
    (if (null? things)
        ans
        (iter (cdr things) 
              (append ans
                      (list (* (car things) (car things)))))
    ))
  (iter items nil)
)

(square-list (list 1 2 3 4 5))
#lang sicp
(define (make-account balance passwd)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
     "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  
  (define (dispatch input m)
    (cond ((not (eq? input passwd)) (lambda (x) "Wrong password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 50)
((acc 'secret-password 'withdraw) 60)
((acc 'secret-password 'deposit) 40)
((acc 'secret-password 'withdraw) 60)
((acc 'someother-password 'withdraw) 60)

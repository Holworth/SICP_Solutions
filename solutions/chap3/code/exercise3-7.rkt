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
    (cond ((eq? m 'get-passwd) passwd)  ; get-passwd, ignore input password
          ((not (eq? input passwd)) (lambda (x) "Wrong password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)))
  dispatch)

(define (make-joint acc passwd new-passwd)  
  (define (dispatch input m)
    (cond ((not (eq? input new-passwd)) (lambda (x) "Wrong password"))
          ((eq? m 'withdraw) (lambda (x) ((acc passwd 'withdraw) x)))
          ((eq? m 'deposit)  (lambda (x) ((acc passwd 'deposit ) x)))))
  (if (eq? passwd (acc 'ignore 'get-passwd))
      dispatch
      "Failed to join account due to wrong password"))

(define acc1 (make-account 100 'passwd1))
(define acc2 (make-joint acc1 'passwd1 'passwd2))
((acc2 'passwd2 'withdraw) 10)
((acc2 'passwd2 'withdraw) 10)
((acc1 'passwd1 'withdraw) 10)
((acc1 'passwd1 'deposit)  100)
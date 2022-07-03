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
  
  (define (safe-withdraw input)
    (if (eq? input passwd)
      withdraw
      "Incorrect password"))
    
  (define (safe-deposit input)
    (if (eq? input passwd)
        deposit
        "Incorrect password"))
  
  (define (dispatch input m)
    (cond ((eq? m 'withdraw) (safe-withdraw input))
          ((eq? m 'deposit)  (safe-deposit input))
          (else (error "Unkown request -- MAKE-AMOUNT" m))))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 50)
((acc 'secret-password 'withdraw) 60)
((acc 'secret-password 'deposit) 40)
((acc 'secret-password 'withdraw) 60)
((acc 'someother-password 'withdraw) 60)

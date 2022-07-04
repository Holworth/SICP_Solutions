#lang sicp
(define (make-account balance passwd)
  (let ((fail 0))
    (define (call-the-cops) "call the cops!!!")
    (define (safe-withdraw input amount)
      (cond ((eq? input passwd)
             (begin 
                (set! balance (- balance amount))
                (set! fail 0)
                balance))
            (else 
                (begin 
                  (set! fail (+ 1 fail))
                  (if (= fail 7) 
                    (call-the-cops)
                    "Incorrect password")))))
    (define (safe-deposit input amount)
      (cond ((eq? input passwd)
             (begin
                (set! balance (+ balance amount))
                (set! fail 0)
                balance))
            (else
                (begin
                  (set! fail (+ fail 1))
                  (if (= fail 7)
                    (call-the-cops)
                    "Incorrect password")))))

    (define (dispatch input m)
      (cond ((eq? m 'withdraw) (lambda (t) (safe-withdraw input t)))
            ((eq? m 'deposit ) (lambda (t) (safe-deposit input t)))))
    dispatch))

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'other-password 'withdraw) 40)
((acc 'other-password 'withdraw) 40)
((acc 'other-password 'withdraw) 40)
((acc 'other-password 'withdraw) 40)
((acc 'other-password 'withdraw) 40)
((acc 'other-password 'withdraw) 40)
((acc 'secret-password 'deposit) 20)
((acc 'other-password 'deposit) 20)

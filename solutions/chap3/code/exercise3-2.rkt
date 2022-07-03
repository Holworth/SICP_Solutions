#lang sicp
(define (make-monitored f)
  (let ((count 0))
    (lambda (.. x)
      (cond ((eq? (car x) 'how-many-calls) count)
            (else (set! count (+1 count)) (f x))))))

(define s (make-monitored sqrt))
(s 'how-many-calls)
(s 4)
(s 'how-many-calls)
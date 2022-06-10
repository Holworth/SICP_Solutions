#lang sicp
(define (subset set) 
  (if (null? set)
      (list nil)
      (let ((rest (subset (cdr set))))
        (append rest 
                (map (lambda (x) 
                        (append (list (car set)) x)) 
                     rest)))))
(subset (list 1 2 3))
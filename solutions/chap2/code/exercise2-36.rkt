#lang sicp
(define (reduce op init items) 
          (cond ((null? items) init)
                (else (op (car items) 
                          (reduce op init (cdr items))))))
(define (reduce-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (reduce op (car init) (map (lambda (x) (car x)) seqs))
            (reduce-n op (cdr init) (map (lambda (x) (cdr x)) seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(reduce-n + (list 0 0 0) s)
#lang sicp
(define (enumerate-interval i j) 
  (if (> i j)
      '()
      (cons i (enumerate-interval (+ i 1) j))))

(define (accumulate init op seq)
  (cond ((null? seq) init)
        (else (op (car seq) 
                  (accumulate init op (cdr seq))))))

(define (unique-pairs n)
  (accumulate 
      nil 
      append 
      (map (lambda (x) 
            (map  (lambda(y) (list x y)) 
                  (enumerate-interval 1 (- x 1))))
          (enumerate-interval 1 n))))

(unique-pairs 10)
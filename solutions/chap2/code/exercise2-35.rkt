#lang sicp
(define (reduce op init items) 
          (cond ((null? items) init)
                (else (op (car items) 
                          (reduce op init (cdr items))))))

(define (count-leaves t)
  (reduce (lambda (x y) (+ x y)) 0 
          (map (lambda (x) 
                (if (not (pair? x))
                    1
                    (count-leaves x))) t)))

(count-leaves (list 1 2))
(count-leaves (list (list 1 2) 3))
(count-leaves nil)
(count-leaves (list (list 1 2) (list 3 (list 5 4)) (list 7)))
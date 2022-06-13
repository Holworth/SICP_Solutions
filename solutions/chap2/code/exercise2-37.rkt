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

(define (dot-product v1 v2) (reduce + 0 (map * v1 v2)))
(define (matrix-*-vector m v) 
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (define l (length (car mat)))
  (define (construct-list n elem) 
    (if (= n 0)
        nil
        (cons elem (construct-list (- n 1) elem))))
  (reduce-n (lambda (x y) (cons x y)) (construct-list l nil) mat))

(define (matrix-*-matrix m n)
  (map (lambda (x) 
          (map (lambda (y) 
                (dot-product x y)) 
              (transpose n))) m))

(define mat (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))

(matrix-*-vector mat (list 1 2 3 4))
(transpose mat)
(matrix-*-matrix mat (transpose mat))
            
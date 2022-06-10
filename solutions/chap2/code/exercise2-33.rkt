#lang sicp
;; We use a conventonal name: Reduce to redefine the accumlate process
(define (reduce op init items) 
          (cond ((null? items) init)
                (else (op (car items) 
                          (reduce op init (cdr items))))))

;; We reduce-map to indicate this version of map is implemented by reduce
;; Same for append and length
(define (reduce-map p items) 
    (reduce (lambda (x y) (append (list (p x)) y)) nil items))
(reduce-map (lambda (x) (+ x 1)) (list 1 2 3))
(reduce-map (lambda (x) (* x x)) (list 1 2 3))

(define (reduce-append seq1 seq2)
  (reduce (lambda (x y) (cons x y)) seq2 seq1))

(reduce-append (list 1 2 3) (list 4 5 6))

(define (reduce-length seq) 
  (reduce (lambda (x y) (+ 1 y)) 0 seq))

(reduce-length (list 1))


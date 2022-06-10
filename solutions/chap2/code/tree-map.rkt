#lang sicp
(define (tree-map proc tree)
  (map (lambda (sub-tree) 
          (if (not (pair? sub-tree))
              (proc sub-tree)
              (tree-map proc sub-tree)))
        tree)
)

(define (square-tree tree) (tree-map (lambda (x) (* x x)) tree))
(define (add-one-tree tree) (tree-map (lambda (x) (+ x 1)) tree))

(define x 
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(square-tree x)
(add-one-tree x)


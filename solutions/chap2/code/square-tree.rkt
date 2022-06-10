#lang sicp
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        ((cons (square-tree (car tree))
               (square-tree (cdr tree)))))
)

(define (square-tree-2 tree)
  (map (lambda (sub-tree) 
        (if (not (pair? sub-tree))
            (* sub-tree sub-tree)
            (square-tree-2 sub-tree)))
       tree))

(define x 
  (list 1
        (list 2 (list 3 4) 5)))

(square-tree x)
(square-tree-2 x)
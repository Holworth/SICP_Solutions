#lang sicp
(define (reduce proc items) 
  (if (= (length items) 1)
      (car items)
      (proc (car items) (reduce proc (cdr items)))))
(define (fringe tree) 
  (if (not (pair? tree))
      (list tree)
      (reduce append (map fringe tree)))
)

;; (reduce append (list (list 1) (list 2)))

(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
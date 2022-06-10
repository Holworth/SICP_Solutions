#lang sicp
(define (deep-reverse tree)
  (if (not (pair? tree))
      tree
      (reverse (map deep-reverse tree))
  )
)

(deep-reverse (list (list 1 2) (list 3 4)))
(deep-reverse (list (list 1 2) 3 4))
#lang sicp
(
  define (last-pair l) 
    (list-ref l (- (length l) 1))
)

(last-pair (list 23 72 149 34))
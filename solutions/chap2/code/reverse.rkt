#lang sicp

(define (reverse l) 
(
  if (= (length l) 1)
  l
  (append (reverse (cdr l)) (list (car l)))))

(reverse (list 1 4 9 16 25))
(reverse (list 1 2))
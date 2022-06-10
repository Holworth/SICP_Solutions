#lang sicp
;; This is some operation called filter
(define (same-property a . l) 
  (define (same-odd x) (= (modulo a 2) (modulo x 2)))
  (define (get-list l) 
    (if (null? l) 
        l
        (if (same-odd (car l))
            (cons (car l) (get-list (cdr l)))
            (get-list (cdr l)))))
  (cons a (get-list l))
)

(same-property 1 2 3 4 5 6 7)
(same-property 2 3 4 5 6 7 8)
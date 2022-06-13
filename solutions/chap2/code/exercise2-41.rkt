#lang sicp
(define (enumerate-interval i j) 
  (if (> i j)
      '()
      (cons i (enumerate-interval (+ i 1) j))))

(define (accumulate init op seq)
  (cond ((null? seq) init)
        (else (op (car seq) 
                  (accumulate init op (cdr seq))))))

(define (all-pairs n)
  (accumulate 
    nil
    append
    (map (lambda (i) 
            (map (lambda (j) (list i j)) 
                (enumerate-interval 1 n)))
        (enumerate-interval 1 n))))


(define (all-triples n)
  (accumulate
    nil
    append
    (map (lambda (x) 
          (map (lambda (p) (cons x p)) 
              (all-pairs n))) 
        (enumerate-interval 1 n))))

(define (sum-of-triple x) 
  (+ (car x) 
     (car (cdr x))
     (car (cdr (cdr x)))))

(define (filter pred seq)
  (if (null? seq)
      nil
      (if (pred (car seq))
          (append (list (car seq)) (filter pred (cdr seq)))
          (filter pred (cdr seq)))))

(filter odd? (list 1 2 3 4))
(sum-of-triple (list 1 2 3))

(define (specify-sum-to s n)
  (filter (lambda (x) (= (sum-of-triple x) s)) 
          (all-triples n)))

;; A simple test
(specify-sum-to 6 3)
(specify-sum-to 15 9)


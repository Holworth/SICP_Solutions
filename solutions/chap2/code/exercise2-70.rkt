#lang sicp
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
                (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

  (define (encode-symbol-1 s result branch)
    (if (leaf? branch)  
        result
        (cond ((element-of-set? s (symbols (left-branch branch)))
                (encode-symbol-1 s (append result (list 0)) (left-branch branch)))
              ((element-of-set? s (symbols (right-branch branch)))
                (encode-symbol-1 s (append result (list 1)) (right-branch branch))))))
(define (encode-symbol s tree)
  (encode-symbol-1 s '() tree))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? (car set) x) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoint-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) 
          (cons x set))
        (else (cons (car set) 
                    (adjoint-set x (cdr set))))))

(define (make-leaf-set pairs)
  (cond ((null? pairs) '())
        (else (adjoint-set 
                (make-leaf (car (car pairs)) (cadr (car pairs)))
                (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge pairs)
  (cond ((= (length pairs) 1) (car pairs))
        (else (successive-merge 
                (adjoint-set (make-code-tree (car pairs) (cadr pairs)) 
                             (cddr pairs))))))

(define sample-tree (generate-huffman-tree (list (list 'A 2) (list 'NA 16) (list 'BOOM 1) 
                                                 (list 'SHA 3) (list 'GET 2) (list 'YIP 9) 
                                                 (list 'JOB 2) (list 'WAH 1))))
sample-tree

(encode (list 'GET 'A 'JOB) sample-tree)
(encode (list 'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'NA) sample-tree)
(encode (list 'GET 'A 'JOB) sample-tree)
(encode (list 'SHA 'NA 'NA 'NA 'NA 'NA 'NA 'NA 'NA) sample-tree)
(encode (list 'WAH 'YIP 'YIP 'YIP 'YIP) sample-tree)
(encode (list 'SHA 'BOOM) sample-tree)

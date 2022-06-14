#lang sicp
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) 
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num)
  (and (number? exp) (= exp num)))

;; Sum expression related
(define (make-sum a1 a2) 
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))

;; Muliplication expression related
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

;; Exponention expression related
(define (make-exponentiation exp n) 
  (cond ((=number? exp 1) 1)
        ((=number? n 1) exp)
        (else (list '** exp n))))
(define (exponentiation? exp) 
  (and (pair? exp) (eq? '** (car exp))))
(define (base x) (cadr x))
(define (exponent x) (caddr x))

;; Define derive process
(define (derive exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (derive (addend exp) var)
                   (derive (augend exp) var)))
        ((product? exp)
          (make-sum 
            (make-product (multiplier exp) 
                          (derive (multiplicand exp) var))
            (make-product (derive (multiplier exp) var) 
                          (multiplicand exp))))
        ((exponentiation? exp)
          (make-product (exponent exp)
                        (make-product (make-exponentiation (base exp) 
                                                           (- (exponent exp) 1))
                                      (derive (base exp) var))))))
(derive '(+ x 3) 'x)
(derive '(* x y) 'x)
(derive '(* (* x y) (+ x 3)) 'x)
(derive '(** x 3) 'x)
;; d((x^2 + 1)^3)/dx = 3(x^2 + 1)^2 * 2x
(derive '(** (+ (** x 2) 1) 3) 'x)



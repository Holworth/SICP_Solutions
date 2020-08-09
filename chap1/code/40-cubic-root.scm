(define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    
    (try first-guess))

(define (derive g)
    (define dx 0.00001)
    (lambda (x) (/ (- (g (+ x dx)) (g x))
                   dx)))

(define (newtons-transform g)
    (lambda (x) (- x
                   (/ (g x)
                      ((derive g) x)))))

(define (newtons-method g guess)
    (fixed-point (newtons-transform g) guess))

(define (cubic a b c)
    (lambda (x) (+  (* x x x)
                    (* a (* x x))
                    (* b x)
                    c)))
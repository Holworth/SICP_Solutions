#lang sicp
(define (estimate-integral radius)
  (define (random-in-range lo hi)
    (let ((range (- hi lo)))
      (+ lo (random range))))

  (define (square x) (* x x))

  (define (in-circal x y)
    (<= (+ (square (- x radius)) (square (- y radius))) 
        (square radius)))

  (define (monte-carlo trials experiment)
    (define (iter remaining-trials pass-trials)
      (cond ((= remaining-trials 0) (+ 0.00000000 (/ pass-trials trials)))
            ((experiment)
              (iter (- remaining-trials 1) (+ pass-trials 1)))
            (else
              (iter (- remaining-trials 1) pass-trials))))
    (iter trials 0))

  (define (in-circal-test)
    (let ((bound (+ radius radius)))
      (in-circal (random-in-range 0 bound) (random-in-range 0 bound))))
  (* 4.0000000 (monte-carlo 10000000 in-circal-test)))

  (estimate-integral 100)
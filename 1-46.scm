#lang racket

(define (iterative-imporve good-enough? f)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (f guess)))
        (if (good-enough? guess next)
            next
            (try next))))
    (try first-guess)))

;for sqrt

(define (square x)
  (* x x))


(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (define (sqrt-good-enough? a b)
    (< (abs (- a b)) 0.00001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-imporve sqrt-good-enough? improve) 1.0))

;for fixed-point

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) 0.00001))
  (define (improve guess)
    (f guess))
  ((iterative-imporve close-enough? improve) first-guess))

(define (f x)
  (+ 1
     (/ 1 x)))

(fixed-point f 1.0)
  
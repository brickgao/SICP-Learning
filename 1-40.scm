#lang racket

(define (deriv g)
  (let ((dx 0.00001))
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx))))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (fixed-point f first-guess)
  (define tolerance  0.000001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (pow x y)
  (if (= y 0)
      1
      (* x (pow x (- y 1)))))

(define (cubic a b c)
  (lambda (x)
    (+ (pow x 3)
       (* a (pow x 2))
       (* b x)
       c)))

(newtons-method (cubic 2 1 0) 1.0)
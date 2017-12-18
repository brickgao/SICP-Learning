#lang racket

(provide average-damp)

(define tolerance  0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try step guess)
    (display "Step ")
    (display step)
    (display ": ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try (+ step 1) next))))
  (try 1 first-guess))

(define (f x)
  (/ (log 1000)
     (log x)))

(fixed-point f 2.0)

(newline)

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(fixed-point (average-damp f) 2.0)
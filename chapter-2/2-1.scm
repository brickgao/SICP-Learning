#lang racket

(define (make-ret n d)
  (let ((g (gcd (abs n) 
                (abs d))))
    (if (> (* n d) 0)
        (cons (/ (abs n) g) (/ (abs d) g))
        (cons (- 0 (/ (abs n) g)) (/ (abs d) g)))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define numer car)
(define denom cdr)

(print-rat (make-ret -1 -2))
(print-rat (make-ret 1 2))
(print-rat (make-ret 1 -2))
(print-rat (make-ret -1 2))

#lang racket

(define (make-segment start end)
  (cons start end))

(define start-segment car)

(define end-segment cdr)

(define (make-point x y)
  (cons x y))

(define x-point car)

(define y-point cdr)

(define (midpoint-segment segment)
  (let ((start-point (start-segment segment))
    (end-point (end-segment segment)))
    (make-point (/ (+ (x-point start-point)
                      (x-point end-point))
                   2.0)
                (/ (+ (y-point start-point)
                      (y-point end-point))
                   2.0))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment (make-segment (make-point 1 2)
                                             (make-point 3 4))))
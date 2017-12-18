#lang racket

(require "1-43.scm")

(define (smooth f)
  (let ((dx 0.00001))
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3))))

(define (square x)
  (* x x))

(((repeated smooth 10) square) 4.0)
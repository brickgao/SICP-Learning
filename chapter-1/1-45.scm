#lang racket

(require "1-43.scm")

(require "1-36.scm")

(require "1-40.scm")

(define (f-l x n)
  (lambda (y)
    (/ x
       (pow y (- n 1)))))

(define (average-damp-n-times f n)
  ((repeated average-damp n) f))

(define (damped-nth-root n damp-times)
  (lambda (x)
    (fixed-point
     (average-damp-n-times
      (f-l x n)
      damp-times)
     1.0)))

((damped-nth-root 4 2) 81.0)



  
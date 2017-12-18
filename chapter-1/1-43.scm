#lang racket

(require "1-42.scm")

(provide repeated)

(define (repeated f n)
  (if (<= n 1)
      (lambda (x)
        (f x))
      (compose f (repeated f (- n 1)))))

(define (square x)
  (* x x))

((repeated square 2) 5)
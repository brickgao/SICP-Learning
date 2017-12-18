#lang racket

(define (make-interval a b)
  (cons a b))

(define upper-bound cdr)

(define lower-bound car)
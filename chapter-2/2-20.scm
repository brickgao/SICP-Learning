#lang racket

(define (same-parity x . others)
  (filter (if (even? x)
              even?
              odd?)
          (cons x others)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
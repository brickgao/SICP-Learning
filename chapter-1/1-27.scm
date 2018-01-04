#lang racket

(require "1-24.scm")

(define (check-iter n a)
  (cond((= a 1) (= (expmod a n n)
                   (remainder a n)))
       (else (and (check-iter n (- a 1))
                  (= (expmod a n n)
                     (remainder a n))))))

(define (check n)
  (newline)
  (display n)
  (if (check-iter n n)
      (display "#t")
      (display "#f")))

(check 561)
(check 1105)
(check 1729)
(check 2465)
(check 2821)
(check 6601)


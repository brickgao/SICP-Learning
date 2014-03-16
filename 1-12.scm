#lang racket

(define (pascal-tri n m)
  (cond ((or (= m 1) (= m n)) 1)
        (else (+ (pascal-tri (- n 1) m)
                 (pascal-tri (- n 1) (- m 1))))))
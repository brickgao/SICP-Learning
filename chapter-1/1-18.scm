#lang racket

(define (mul-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (mul-iter a
                             (+ b b)
                             (/ n 2)))
        (else (mul-iter (+ a b)
                        b
                        (- n 1)))))
    
(define (mul a b)
  (mul-iter 0 a b))

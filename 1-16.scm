#lang racket

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt-iter a b i)
  {cond ((= i 0) a)
        ((even? i) (fast-expt-iter a  
                                   (* b b)
                                   (/ i 2)))
        (else (fast-expt-iter (* a b)
                              b
                              (- i 1)))})

(define (fast-expt a n)
  {fast-expt-iter 1 a n})
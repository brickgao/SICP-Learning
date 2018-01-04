#lang racket

(define (curt-iter guess x)
  (if (good-enough? guess x)
      guess
      (curt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ 
   (+ 
    (/ x 
       (* guess guess)) 
    (* 2 guess)) 
   3))

(define (good-enough? guess x)
  (< (abs (- (/ (improve guess x) guess) 1)) 0.001))


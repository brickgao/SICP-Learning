#lang racket

;1-13(a)

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (next n)
  (+ n 2))

(define (term n)
  (* (/ (- (exact->inexact n) 1) n)
     (/ (+ n 1) n)))

(product term 3 next 1001)

;1-13(b)

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* (term a) result))))
  (iter a 1))

(product-iter term 3 next 1001)
  

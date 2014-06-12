#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  
  (define (inc n) (+ n 1))
  
  (define h (/ (- b a) n))
  
  (define (factor k)
    (cond ((or (= k 0) (= k n))
           1)
          ((odd? k)
           4)
          (else
           2)))
  
  (define (ff k)
    (f (+ a (* k h))))
  
  (define (term k)
    (* (factor k)
       (ff k)))
  
  (if (odd? n)
      (display "n must be even")
      (* (/ h 3)
         (sum term 0 inc n))))

(define (cube x)
  (* x x x))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
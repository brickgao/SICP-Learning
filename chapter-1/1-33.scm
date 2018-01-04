#lang racket

(define (filtered-accumulate combiner null-value filter term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (filtered-accumulate combiner null-value term (next a) a next b)
          (combiner (term a)
                    (filtered-accumulate combiner null-value term (next a) a next b)))))

;1-33(a)

(require "1-22.scm")

(define (sum term a next b)
  (filtered-accumulate + 0 prime? term a next b))

(define (self n)
  n)

(define (inc n)
  (+ n 1))

(define (prime-sum-from-a-to-b a b)
  (sum self a inc b))

;1-33(b)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (coprime a b)
  (= (gcd a b) 1))

(define (sum-above-n n)
  
  (define (n-filter a)
    (coprime a n))
  
  (define (self a)
    a)
  
  (define (inc n)
    (+ n 1))
  
  (filtered-accumulate + 0 n-filter self 0 inc n))


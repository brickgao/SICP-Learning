#lang racket

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (sqrt test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (newline)
  (display n)
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time))
      (start-prime-test (+ n 1) (current-inexact-milliseconds))))
  

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)

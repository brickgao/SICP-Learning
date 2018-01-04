#lang racket

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next num)
  (if (= num 2)
      3
      (+ num 2)))

(define (find-divisor n test-divisor)
  (cond ((> (sqrt test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes n)
  (newline)
  (start-prime-test n (current-inexact-milliseconds) 3))

(define (start-prime-test n start-time times)
  (newline)
  (display n)
  (if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time))
      (start-prime-test (+ n 1) (current-inexact-milliseconds) times))
  (cond ((prime? n)
         (cond ((> times 0) (start-prime-test (+ n 1) (current-inexact-milliseconds) (- times 1)))))))
  

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(search-for-primes 1000)
(search-for-primes 10000)
(search-for-primes 100000)
(search-for-primes 1000000)


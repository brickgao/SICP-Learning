#lang racket

(define (square n)
  (* n n))
  
(define (not-trivial-square-root? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((not-trivial-square-root? base m)
         0)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                   m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                   m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (check n)
  (fast-prime? n 1000))

(check 11)
(check 13)
(check 561)
(check 1105)
(check 1111)
(check 1729)
(check 2465)
(check 2821)
(check 6601)
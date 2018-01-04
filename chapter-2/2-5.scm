#lang racket

(define (pow x y)
  (if (= y 0)
      1
      (* x
         (pow x (- y 1)))))

(define (cons x y)
  (* (pow 2 x)
     (pow 3 y)))

(define (car z)
  (define (divide? x)
    (= 0
       (remainder x 2)))
  (if (divide? z)
      (+ 1
         (car (/ z 2)))
      0))

(define (cdr z)
  (define (divide? x)
    (= 0
       (remainder x 3)))
  (if (divide? z)
      (+ 1
         (cdr (/ z 3)))
      0))


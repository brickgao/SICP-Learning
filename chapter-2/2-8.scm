#lang racket

(define (make-interval a b)
  (cons a b))

(define upper-bound cdr)

(define lower-bound car)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (+ (lower-bound x) (- 0
                                       (upper-bound y)))
                 (+ (upper-bound x) (- 0
                                       (lower-bound y)))))


(sub-interval (make-interval 5 8)
              (make-interval 1 2))

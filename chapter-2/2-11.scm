#lang racket

(define (make-interval a b)
  (cons a b))

(define upper-bound cdr)

(define lower-bound car)

(define (neg? x)
        (< x 0))

(define (pos? x)
        (>= x 0))

(define (mul-interval x y)
  (let ((p1 (lower-bound x))
        (p2 (upper-bound x))
        (p3 (lower-bound y))
        (p4 (upper-bound y)))
    (cond ((and (neg? p1) (neg? p2) (neg? p3) (neg? p4)) (make-interval (* p2 p4) (* p1 p3)))
          ((and (neg? p1) (pos? p2) (neg? p3) (neg? p4)) (make-interval (* p2 p3) (* p1 p3)))
          ((and (neg? p1) (neg? p2) (neg? p3) (pos? p4)) (make-interval (* p1 p4) (* p2 p4)))
          ((and (pos? p1) (pos? p2) (pos? p3) (pos? p4)) (make-interval (* p1 p3) (* p2 p4)))
          ((and (neg? p1) (pos? p2) (pos? p3) (pos? p4)) (make-interval (* p1 p4) (* p2 p4)))
          ((and (pos? p1) (pos? p2) (neg? p3) (pos? p4)) (make-interval (* p2 p3) (* p2 p4)))
          ((and (pos? p1) (pos? p2) (neg? p3) (neg? p4)) (make-interval (* p2 p4) (* p1 p3)))
          ((and (neg? p1) (neg? p2) (pos? p3) (pos? p4)) (make-interval (* p1 p3) (* p2 p4)))
          ((and (neg? p1) (pos? p2) (neg? p3) (pos? p4)) (make-interval (min (* p1 p4) (* p2 p3))
                                                                        (max (* p1 p3) (* p2 p4)))))))

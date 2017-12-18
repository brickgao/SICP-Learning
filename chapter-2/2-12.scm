#lang racket

(define (make-interval a b)
  (cons a b))

(define (make-center-percent c p)
  (let ((delta (* c p)))
    (make-interval (- c delta) (+ c delta))))
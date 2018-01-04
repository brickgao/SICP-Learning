#lang racket

(define (first-denomination l)
  (car l))

(define (except-frist-denomination l)
  (cdr l))

(define (no-more? l)
  (null? l))

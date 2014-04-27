#lang racket

(require "1-16.scm")

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
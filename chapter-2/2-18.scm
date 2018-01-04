#lang racket

(define (reverse l)
  (if (null? l)
      null
      (append (reverse (cdr l)) (list (car l)))))

(reverse (list 1 4 9 16 25))

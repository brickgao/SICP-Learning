#lang racket

;;; f using recursion

(define (f-recu n)
  (cond ((< n 3) n)
        (else (+ (f-recu (- n 1))
                 (* 2 (f-recu (- n 2))) 
                 (* 3 (f-recu (- n 3)))))))

;;; f using iterator

(define (f-iter a b c i n)
  (if (= i n)
      c
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (+ i 1)
              n)))

(define (f n)
  (f-iter 2 1 0 0 n))


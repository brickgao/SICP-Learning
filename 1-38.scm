#lang racket

(define (cont-frac n d k)
  (define (cont-frac-step i)
    (if (= i k)
        (/ (n i)
           (d i))
        (/ (n i)
           (+ (d i)
              (cont-frac-step (+ i 1))))))
  (cont-frac-step 1))
        
(define (f-n i)
  (cond ((= i 1) 1)
        ((= i 2) 2)
        ((= 0 (remainder i 3))
         1)
        ((= 1 (remainder i 3))
         1)
        ((= 2 (remainder i 3))
         (* (+ 1 (/ (- i 2) 3))
               2))))
  

(+ (cont-frac (lambda (i) 1.0)
           f-n
           100)
   2)
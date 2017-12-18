#lang racket

(define (cont-frac n d k)
  (define (cont-frac-step i)
    (if (= i k)
        (/ (n i)
           (d i))
        (/ (n i)
           (- (d i)
              (cont-frac-step (+ i 1))))))
  (cont-frac-step 1))

(define (pow x y)
  (if (= y 0)
      1
      (* x (pow x (- y 1))))) 

(define (tan-cf x k)
  (cont-frac (lambda (i) (pow x i))
             (lambda (i) (- (* i 2)
                            1))
             k))
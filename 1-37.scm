#lang racket

;1-37(a)

(define (cont-frac n d k)
  (define (cont-frac-step i)
    (if (= i k)
        (/ (n i)
           (d i))
        (/ (n i)
           (+ (d i)
              (cont-frac-step (+ i 1))))))
  (cont-frac-step 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

;1-37(b)

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i)
                    result)))))
  (iter k 0))
      
(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                100)
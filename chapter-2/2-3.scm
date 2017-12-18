#lang racket

(define (make-point x y)
  (cons x y))

(define x-point car)

(define y-point cdr)

(define (make-segment start end)
  (cons start end))

(define start-segment car)

(define end-segment cdr)

(define (girth-rectangle rectangle)
  (let ((length (length-rectangle rectangle))
        (width (width-rectangle rectangle)))
    (* (+ length width)
       2)))

(define (area-rectangle rectangle)
  (let ((length (length-rectangle rectangle))
        (width (width-rectangle rectangle)))
    (* length width)))

(define (make-rectangle segment-one segment-two)
  (cons segment-one segment-two))

(define (square x)
  (* x x))

(define (length-segment segment)
  (sqrt (+ (square (- (x-point (start-segment segment))
                      (x-point (end-segment segment))))
           (square (- (y-point (start-segment segment))
                      (y-point (end-segment segment)))))))

(define one-segment car)

(define two-segment cdr)

(define (length-rectangle rectangle)
  (length-segment (one-segment rectangle)))

(define (width-rectangle rectangle)
  (length-segment (make-segment (start-segment (one-segment rectangle))
                                (start-segment (two-segment rectangle)))))
          
(area-rectangle (make-rectangle (make-segment (make-point 1 2)
                                              (make-point 1 5))
                                (make-segment (make-point -1 2)
                                              (make-point -1 5))))

;just change the method to get width and length of the rectangle

  
#lang racket

(define (last-pair l)
	(let ((nxt-l (cdr l)))
		(if (null? nxt-l)
				(list(car l))
				(last-pair nxt-l))))

(last-pair (list 23 72 149 34))
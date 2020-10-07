#lang sicp

(define (square x)
  (* x x))

(define (good-enough? guess old-guess)
  (< (abs (- guess old-guess)) (* guess 0.001)))

(define (improve guess x)
  (/ (+ (* 2 guess)
        (/ x (square guess)))
     3))

(define (cbrt-iter guess old-guess x)
  (if (good-enough? guess old-guess)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))

(define (cbrt x)
  (cbrt-iter 1.0 0.0 x))

(cbrt 125)

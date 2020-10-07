#lang sicp

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  ; If this uses 'new-if' then the program runs out of memory as it loops infinitely. With the special form 'if' the recursion can break because not all operands are evaluated.
  ; With 'new-if' however, both operands are evaluated which means it is impossible to break the cyclical definition of 'sqrt-iter'.
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

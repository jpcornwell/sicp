#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Since Scheme allows for compound expressions to be used as operators, the above actually works.
; The choice of operator is in itself a function based on the value of b.
; This particular example behaves as if you took the absolute value of b and added it to a.

(a-plus-abs-b 5  4)
(a-plus-abs-b 5 -4)

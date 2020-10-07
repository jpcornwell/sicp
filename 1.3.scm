#lang sicp

; Writing the square function as '^2' seems to work. That's really cool!
(define (^2 x) (* x x))

(define (sum-of-squares x y) (+ (^2 x) (^2 y)))

(define (f x y z) (cond ((and (>= x z) (>= y z))
                         (sum-of-squares x y))
                        ((and (>= x y) (>= z y))
                         (sum-of-squares x z))
                        ((and (>= y x) (>= z x))
                         (sum-of-squares y z))))

(f 3 1 1)

#lang sicp

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; This gives 0.0323 instead of 0.0001
(sqrt 0.0001)

; Small inputs like this can give inaccurate results because the epsilon used to
; determine if the guess is close enough is fixed. If given an input with a
; small enough magnitude, the epsilon becomes worthless, and we would need to
; further shrink the epsilon to achieve accuracy once again.

; This loops forever
; (sqrt 10000000000000)

; Also, large inputs can cause problems. In this case it is due to the limited
; precision afforded to floating point numbers. Here we eventually get a guess
; with a value of 3162277.6601683795. If we square this, we get
; 10000000000000.002. This just barely falls outside the epsilon range we
; created so we execute the logic to improve the guess. Improving the guess
; however yields the exact same number because the floating point data type
; can't give back anything more precise. This causes an infinite loop.

(define (b-good-enough? guess old-guess)
  (< (abs (- guess old-guess)) (* guess 0.001)))

(define (b-improve guess x)
  (average guess (/ x guess)))

(define (b-sqrt-iter guess old-guess x)
  (if (b-good-enough? guess old-guess)
      guess
      (b-sqrt-iter (b-improve guess x)
                   guess
                   x)))

(define (b-sqrt x)
  (b-sqrt-iter 1.0 0.0 x))

; Providing an alternative algorithm for good-enough? can fix both issues.
; The accuracy is improved because the new epsilon will become smaller as
; the magnitude of the input becomes smaller. The infinite loop is prevented
; because eventually old-guess and guess will become the same and subtract
; to zero, which will always be smaller than the calculated epsilon. (Well,
; unless it's possible to create a guess so small that multiplying it by
; 0.001 causes the epsilon to go negative due to lack of precision.) The
; only drawback is the accuracy for larger inputs has actually suffered,
; because just as epsilon shrinks as the input's mangitude shrinks, it also
; grows as the input's magnitude grows. You could use a min function and
; use the smaller of 0.001 or 0.001 * guess to improve that though.

(b-sqrt 0.000000000001)
(b-sqrt 10000000000000)

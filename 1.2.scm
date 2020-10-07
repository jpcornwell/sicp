#lang sicp

; By default this will give back an exact value in the form of a rational number
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))


; By changing '5' to '5.0' we will get an inexact result in the form of a floating point number
(/ (+ 5.0 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

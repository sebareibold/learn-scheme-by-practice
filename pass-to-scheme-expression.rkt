#lang racket
; (a)(4x 7) - (13 + 5)
; (b) (3x (4 + (-5 - -3)))
; (c) 5 x ((537 x (98.3 + (375 - (2.5 x 153)))) + 255

(- (* 4 7)(+ 13 5))
(* 3 (+ 4 (- -5 -3)))

(* 5 (+ 255 (* 537 (+ 98.3 (- 375 (* 2.5 153))))) )
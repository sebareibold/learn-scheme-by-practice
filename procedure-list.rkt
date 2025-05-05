#lang racket
; Ejercicio 3

(cons 'one (cons 'two (cons 'tree (cons 'four '()))))

(cons 'one (cons (cons 'two (cons 'tree (cons 'four '())))'()))

(cons (cons 'one (cons 'two '())) (cons (cons 'tree (cons 'force '())) '()))

(cons(cons (cons 'one '()) '()) '())
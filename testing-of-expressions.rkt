#lang racket
; Ejercicio 4
; Obs:
;  - cdr: retorna toda la lista menos el primer elemento.
;  - car: retrona el primer elemento de la lista.
;  En si se aplica la secuencia entre c y r, por ejemplo
;  en si d se aplica cdr y se tenemos a se aplica car,
;  ej: si tenemos cadr lista => (car (cdr lista))

(cdr '((a (b c) d)))
(car (cdr (cdr '(a (b c) (d e)))))
(car (cdr '((1 2) (3 4) (5 6))))
(cdr (car '((1 2) (3 4) (5 6))))
(car (cdr (car '((cat dog hen))))) ; => cadar '((cat dog hen))
(cadr '(a b c d)) ; => (car (cdr '(a b c d)))
(cadar '((a b) (c d) (e f))) ; => (car (cdr ( car '((a b) (c d) (e f))))

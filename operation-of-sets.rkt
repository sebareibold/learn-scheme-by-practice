
#lang racket

;; --- Funciones Auxiliares ---

;; Elimina duplicados de una lista.
(define (remover-duplicados lista)
  (let recur ((lista-actual lista) (resultado '()))
    (if (empty? lista-actual)
        ;; Invertimos el resultado porque usamos cons para construirlo
        (reverse resultado)
        (let ((elemento (car lista-actual)))
          (if (member elemento resultado)
              ;; Si el elemento ya está en el resultado, lo ignoramos
              (recur (cdr lista-actual) resultado)
              ;; Si no está, lo añadimos y continuamos
              (recur (cdr lista-actual) (cons elemento resultado)))))))

;; --- Operaciones de Conjuntos ---

;; (a) Inclusión (Subconjunto)
(define (es-subconjunto? conjunto-mayor subconjunto)
  (andmap (lambda (elemento) (member elemento conjunto-mayor)) subconjunto))

;; (b) Igualdad
(define (conjuntos-iguales? conjunto1 conjunto2)
  (and (es-subconjunto? conjunto1 conjunto2)
       (es-subconjunto? conjunto2 conjunto1)))

;; (c) Unión
(define (union-conjuntos conjunto1 conjunto2)
  (remover-duplicados (append conjunto1 conjunto2)))

;; (d) Intersección
(define (interseccion-conjuntos conjunto1 conjunto2)
  (remover-duplicados (filter (lambda (elemento) (member elemento conjunto2)) conjunto1)))

;; (e) Diferencia
(define (diferencia-conjuntos conjunto1 conjunto2)
  (remover-duplicados (filter (lambda (elemento) (not (member elemento conjunto2))) conjunto1)))

;; (f) Producto Cartesiano
(define (producto-cartesiano-conjuntos conjunto1 conjunto2)
  (for*/list ((elem1 conjunto1) (elem2 conjunto2))
    (list elem1 elem2)))



(display "--- Pruebas ---") (newline)


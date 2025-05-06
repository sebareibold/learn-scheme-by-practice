#lang racket
; Elementos Utilizados
;   If:(if condición consecuente alternativa). Ej: (if (= (+ 1 2) 3) 'si 'no)
;   car: 1er elem
;   cdr: list con 1er elem eliminado
;   define: Define procedimiento
;   empty?.
;   append: Concatena 
;   cons.
;   reverse.
;   eq?:

;Rotacion a la izquierda
(define (rotIzq lista) (if (empty? lista)'() (append (cdr lista) (list (car lista)))))

; Rotación a la derecha
(define (rotDer lista)
  (if (empty? lista)
      '()
      (if (empty? (cdr lista))
          lista
          (rotDerAux lista '()))))

(define (rotDerAux lista-actual acumulador-prefijo)
  (if (empty? (cdr lista-actual))
      (cons (car lista-actual) (reverse acumulador-prefijo))
      (rotDerAux (cdr lista-actual) (cons (car lista-actual) acumulador-prefijo))))

; eliminación de todas las ocurrencias de un elemento
(define (eliminarOcurrencias lista elem)
  ; Caso base: Si la lista esiá vacia
  (if (empty? lista)
      '()
      ; Caso recursivo: La lista no está vacía
      (if (eq? (car lista) elem) 
          (eliminarOcurrencias (cdr lista) elem)
          (cons (car lista) (eliminarOcurrencias (cdr lista) elem)))))

; Sustitucion de todas las ocurrencias de un elemento por otro
(define (sustituirOcurrencias lista elem-viejo elem-nuevo)
  ; Caso base: Si la lista está vacía, no hay nada que sustituir, retorna lista vacía
  (if (empty? lista)
      '()
      ; Caso recursivo: La lista no está vacía
      (if (eq? (car lista) elem-viejo)
          ; Si el primer elemento es el que queremos sustituir, lo sustituimos por elem-nuevo
          (cons elem-nuevo (sustituirOcurrencias (cdr lista) elem-viejo elem-nuevo))
          ; Si el primer elemento NO es el que queremos sustituir, lo conservamos
          (cons (car lista) (sustituirOcurrencias (cdr lista) elem-viejo elem-nuevo)))))

; Cardinalidad de un elemento
(define (cardinalidadElemento lista elem)
  ; Caso base: Si la lista está vacía, el elemento no aparece, retorna 0
  (if (empty? lista)
      0
      ; Caso recursivo: La lista no está vacía
      (if (eq? (car lista) elem)
          ; Si el primer elemento es el que buscamos, sumamos 1
          ; al conteo obtenido de la llamada recursiva sobre el resto
          (+ 1 (cardinalidadElemento (cdr lista) elem))
          ; Si el primer elemento NO es el que buscamos, el conteo es simplemente
          ; el obtenido de la llamada recursiva sobre el resto
          (cardinalidadElemento (cdr lista) elem)))))

; Inversion
(define (inversion lista)
  ; Función auxiliar recursiva con acumulador
  ; lista-restante: la parte de la lista original que falta por procesar
  ; acumulador: la lista invertida construida hasta el momento
  (define (inversion-aux lista-restante acumulador)
    ; Caso base: Si la lista restante está vacía, el acumulador tiene el resultado final
    (if (empty? lista-restante)
        acumulador
        ; Caso recursivo: Toma el primer elemento de la lista restante,
        (inversion-aux (cdr lista-restante) (cons (car lista-restante) acumulador))))
  ; Inicia el proceso llamando a la auxiliar con la lista original y un acumulador vacío
  (inversion-aux lista '()))

; Sufijo
(define (sufijo lista n)
  ; Caso base: Si la lista está vacía O si n es 0 (no hay que quitar más elementos)
  (if (or (empty? lista) (= n 0))
      ; Retorna la lista actual (que será la lista original si n=0, o '() si se vació)
      lista
      ; Caso recursivo: Si n es mayor que 0 y la lista no está vacía...
      (sufijo (cdr lista) (- n 1))))

  
  
(display "--- Pruebas ---") (newline)
(rotIzq '(1 2 3))
(rotDer '(1 2 3))
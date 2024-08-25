;; División entera entre 10
;; Nesu 2022. Optimizado por Joaquín Ferrero y Nesu en 2023
;; Entrada en A. Salida en A. Destruye B y C.
;;
;; N/10 = N/2 * 1/5  que se aproxima a  N/2 * 13/64
;; 13/64 = (1 + 4 + 8) / 64 = (1/8 + 1/2 + 1) / 8
;; Por tanto, N/10 aproximadamente es (N/16 + N/4 + N/2) / 8
;;
;; 19 bytes / 21 microsegundos
;; Input:    A como dividendo
;; Output:   A como cociente
;; Destruye: BC,A 
division_entre_10::
ld bc,#0xC0FE ; [3] Un coffee para empezar bien el día :)
srl a     ; [2]  A = N/2
add b     ; [1]  Ajuste para valores de
sbc b     ; [1]    entrada mayores que 127
ld b,a    ; [1]  B = N/2
and c     ; [1]
rra       ; [1]  A = N/4
rra       ; [1]  A = N/8
add b     ; [1]  A = N/8  + N/2
rra       ; [1]  A = N/16 + N/4
add b     ; [1]  A = N/16 + N/4 + N/2
rra       ; [1]  A = (N/16 + N/4 + N/2) / 2
and c     ; [1]
rra       ; [1]  A = (N/16 + N/4 + N/2) / 4
rra       ; [1]  A = (N/16 + N/4 + N/2) / 8
ret       ; [3]
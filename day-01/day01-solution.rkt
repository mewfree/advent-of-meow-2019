#lang racket

; shared
(define lines
  (map string->number
       (file->lines "input")))

(define (fuel-calc module-mass)
  (- (quotient module-mass 3) 2))

; part 1
(display "Part 1: ")
(for/sum
  ([line lines])
  (fuel-calc line))

; part 2
(define (recursive-fuel-calc module-mass mass-list)
  (cond
    [(> (fuel-calc module-mass) 0)
     (recursive-fuel-calc
       (fuel-calc module-mass)
       (append mass-list (list (fuel-calc module-mass))))]
    [(apply + mass-list)]))

(display "Part 2: ")
(for/sum
  ([line lines])
  (recursive-fuel-calc line '()))

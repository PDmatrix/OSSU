;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; String -> String
;; produce pluralized word
(check-expect (pluralize "day") "days")
(check-expect (pluralize "pen") "pens")

;(define (pluralize word) "") ; this is a stub

;(define (pluralize word) ; this is a template
;  (... word))

(define (pluralize word)
  (string-append word "s"))
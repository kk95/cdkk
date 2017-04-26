#lang racket


(require mutt)
(require csv-reading)
(require net/url)
(require xml)
(require html)
(require (prefix-in htdp: htdp/gui))


(define (add_stock a) (begin (print "as") #t))
(define (remove_stock a)  (begin  (print "stock") #t))
(define (view_open a) (begin  (print "view_open") (htdp:draw-message i "<print open price>") #t))
(define (view_purchase a)  (begin  (print "view_purchase") (htdp:draw-message i "<print current price>") #t))
(define (view_close a)  (begin (print "close") (htdp:draw-message i "<print close price>") #t))
(define (set_auto a)  (begin (print "set_auto") #t))
(define (send a)  (begin (print "sent") #t))
(define (nothing a) #t)


(define b (htdp:make-button "Remove Stock" remove_stock))
(define c (htdp:make-button "View Purchase" view_purchase))
(define d (htdp:make-button "View Open" view_open))
(define e (htdp:make-button "View Close" view_close))
(define f (htdp:make-button "Send" send))
(define g (htdp:make-button "Auto Send" set_auto))
(define h (htdp:make-text "STOCK SYMB"))
(define i (htdp:make-button " " nothing))
(define j (htdp:make-text "Notify when stock changes by:"))

(htdp:create-window  (list (list h) (list g j) (list b f) (list c d e) (list i)))





;(print "Enter the stock symbol")


;(define stksymbol (read))

;(define stkurl (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" (symbol->string stksymbol) "&f=abo"))

;(define myurl (string->url stkurl))
;(define myport (get-pure-port myurl))
;(display-pure-port myport)



;(define temp (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml myport)))))))

;(define (get-stock-values stksymbol)
 ; (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml (get-pure-port (string->url (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" (symbol->string stksymbol) "&f=po"))))))))))

;(define (send-txt txtm)
;  (mutt (string-join(get-stock-values txtm))
;      #:to "9789962939@tmomail.net"
;      #:subject (symbol->string txtm)))
;(define s (read))
;(send-txt s)
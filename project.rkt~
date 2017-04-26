#lang racket

(require mutt)
(require csv-reading)
(require net/url)
(require xml)
(require html)
(print "Enter the stock symbol")

;(define stksymbol (read))

;(define stkurl (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" (symbol->string stksymbol) "&f=abo"))

;(define myurl (string->url stkurl))
;(define myport (get-pure-port myurl))
;(display-pure-port myport)



;(define temp (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml myport)))))))

(define (get-stock-values stksymbol)
  (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml (get-pure-port (string->url (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" (symbol->string stksymbol) "&f=po"))))))))))

(define (send-txt txtm)
  (mutt (string-join(get-stock-values txtm))
      #:to "9789962939@tmomail.net"
      #:subject (symbol->string txtm)))
(define s (read))
(send-txt s)
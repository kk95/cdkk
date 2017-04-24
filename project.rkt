#lang racket

(require mutt)
(require csv-reading)
(require net/url)
(require xml)
(require html)

(print "Command Line:")

(newline)



(define (get-stock-values stksymbol)
  (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml (get-pure-port (string->url (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" (symbol->string stksymbol) "&f=po"))))))))))

(define (stkinterp invalues)
  (cond [(eq? (car invalues) 'add_stock) (make-stock (cadr invalues))]
               [(eq? (car invalues) 'help) (begin
                                             (print "add_stock STOCKNAME")
                                             (newline))]))
         ;(stkinterp (read))))

(define (make-stock symbolname)
  (let ((stocksymbol symbolname)
        (stockvals (get-stock-values symbolname)))
        (lambda (command)
          (cond [(eq? command 'symbol) stocksymbol]
                [(eq? command 'open) (cadr stockvals)]
                [(eq? command 'close) (car stockvals)]
                [(eq? command 'send) (send-txt stocksymbol)]))))

(define method (stkinterp (read)))

;(define stksymbol (read))

;(define stkurl (string-append "http://download.finance.yahoo.com/d/quotes.csv?s=" (symbol->string stksymbol) "&f=abo"))

;(define myurl (string->url stkurl))
;(define myport (get-pure-port myurl))
;(display-pure-port myport)



;(define temp (map cadr (cdadr (csv->sxml (pcdata-string (car (read-html-as-xml myport)))))))

(define (send-txt txtm)
  (mutt (string-join(get-stock-values txtm))
      #:to "9789962939@tmomail.net"
      #:subject (symbol->string txtm)))

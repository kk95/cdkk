#lang racket

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
                [(eq? command 'close) (car stockvals)]))))

(define method (stkinterp (read)))
